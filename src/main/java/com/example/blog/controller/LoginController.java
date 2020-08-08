package com.example.blog.controller;

import com.example.blog.error.ErrorInfoException;
import com.example.blog.form.LoginForm;
import com.example.blog.service.LoginService;
import com.example.blog.service.UserService;
import com.example.blog.util.UUIDCreater;
import com.example.blog.vo.AllUserInfoVo;
import com.example.blog.vo.LeaveApplyVo;
import com.example.blog.vo.RecordVo;
import com.example.blog.vo.UserInfoVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public String login(LoginForm loginForm, HttpSession session) throws ErrorInfoException {
        log.info("===登录===参数为{}",loginForm);
        UserInfoVo userInfoVo = loginService.login(loginForm);
        if (userInfoVo.getUserName() != null) {
            String token = UUIDCreater.createUUID();
            log.info("用户:{}登录成功,生成token:{}，注入到session中", userInfoVo.getUserName(), token);
            session.setAttribute("tokenId", token);
            session.setAttribute("userName", userInfoVo.getUserName());
            session.setAttribute("userId", userInfoVo.getUserId());
            session.setAttribute("role", userInfoVo.getRole());
            if ("1".equals(userInfoVo.getRole())) {
                List<RecordVo> li = userService.getRecord(userInfoVo.getUserId());
                log.info("查询学生的异常考勤信息,result:{}", li);
                session.setAttribute("li", li);
                return "/mainView";
            }
            if ("2".equals(userInfoVo.getRole())) {
                List<LeaveApplyVo> la = userService.getApplyRecord(userInfoVo.getUserId());
                log.info("查询所有学生的请假申请信息,result:{}", la);
                session.setAttribute("la", la);
                return "/mainViewTeacher";
            }
            List<AllUserInfoVo> lau = userService.selectAllUserInfo();
            log.info("查询所有用户信息,result:{}", lau);
            session.setAttribute("lau", lau);
            return "/mainViewMaster";
        } else {
            throw new ErrorInfoException("用户名或密码错误！");
        }
    }

    @RequestMapping("/index")
    public String index() {
        return "/index";
    }

    @RequestMapping("/exit")
    public String exit(HttpSession session) {
        session.setAttribute("tokenId", "");
        return "/index";
    }

}