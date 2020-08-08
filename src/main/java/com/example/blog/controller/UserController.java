package com.example.blog.controller;

import com.example.blog.entity.*;
import com.example.blog.error.ErrorInfoException;
import com.example.blog.form.AddUserForm;
import com.example.blog.form.ApplyLeaveForm;
import com.example.blog.form.AttendErrorForm;
import com.example.blog.form.UpdateForm;
import com.example.blog.mapper.UserMapper;
import com.example.blog.service.UserService;
import com.example.blog.util.LeaveDateUtil;
import com.example.blog.util.UUIDCreater;
import com.example.blog.vo.AllUserInfoVo;
import com.example.blog.vo.LeaveApplyVo;
import com.example.blog.vo.LeaveRecordVo;
import com.example.blog.vo.PersonalMessageVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Slf4j
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    private static final int NOREAD = 0; // 待审批
    private static final int LEAVE = 1; // 事假
    private static final int ABSENCE = 2; // 旷到
    private static final String PWD = "123"; // 默认密码
    private static final String INSTRUCTORID = "2015263040001"; // 默认辅导员ID
    private static final int ROLE = 0; // 默认身份-学生

    /**
     * 查看个人中心
     * @param userId
     * @param session
     * @return
     * @throws ErrorInfoException
     */
    @GetMapping("/center")
    public String center(String userId, HttpSession session) throws ErrorInfoException {
        PersonalMessageVo personalMessageVo = userService.getUserInfo(userId);
        log.info("个人中心信息查询,param:{},result:{}", userId, personalMessageVo);
        if (personalMessageVo == null) {
            log.info("查找用户信息为空,param:{}", userId);
            throw new ErrorInfoException("未找到该用户的信息！");
        }
        session.setAttribute("personalInfo", personalMessageVo);
        return "/personalCenter";
    }

    @RequestMapping("/back")
    public String back(HttpServletRequest request) {
        Object role = request.getSession().getAttribute("role");
        log.info("个人中心返回,身份值：{}", role);
        if ("1".equals(role)) {
            return "/mainView";
        }
        if ("2".equals(role)) {
            return "/mainViewTeacher";
        }
        return "/mainViewMaster";
    }

    @RequestMapping("/addAttendError")
    public String addAttendError() {
        // 考勤异常页面跳转
        return "/addAttendError";
    }

    @PostMapping("/addAttendErrorInfo")
    public String addAttendErrorInfo(AttendErrorForm attendErrorForm) throws ErrorInfoException {
        log.info("新增考勤异常信息,获取的表单信息:{}", attendErrorForm);
        if (attendErrorForm == null) {
            throw new ErrorInfoException("新增考勤异常信息失败！");
        }
        UserInfo userInfo = userService.getStudentInfo(attendErrorForm.getUserId());
        AbsenceRecord absenceRecord = new AbsenceRecord();
        absenceRecord.setUuid(UUIDCreater.createUUID());
        absenceRecord.setUserId(userInfo.getUserId());
        absenceRecord.setUserName(userInfo.getUserName());
        absenceRecord.setMajor(userInfo.getMajor());
        absenceRecord.setAbsenceDate(attendErrorForm.getDate());
        absenceRecord.setAbsenceCount(attendErrorForm.getAbsenceCount());
        // 添加异常信息前，查询学生当天是否已请假
        IdAndDate idAndDate = new IdAndDate();
        idAndDate.setUserId(attendErrorForm.getUserId());
        idAndDate.setDate(attendErrorForm.getDate());
        int m = userService.selectCountInfo(idAndDate);
        if (m >= 1) {
            absenceRecord.setAbsenceReason(LEAVE);
        } else {
            absenceRecord.setAbsenceReason(ABSENCE);
        }
        log.info("新增考勤异常信息,param:{}", absenceRecord);
        int i = userService.addAttendErrorInfo(absenceRecord);
        if (i != 1) {
            throw new ErrorInfoException("新增考勤异常信息失败！");
        }
        return "/addAttendError";
    }

    @RequestMapping("/applyLeave")
    public String applyLeave() {
        // 请假申请页面跳转
        return "/applyLeave";
    }

    @PostMapping("/applyLeaveInfo")
    public String applyLeaveInfo(ApplyLeaveForm applyLeaveForm, HttpSession session) throws ErrorInfoException {
        log.info("请假申请表单信息,param:{}", applyLeaveForm);
        if (applyLeaveForm == null) {
            throw new ErrorInfoException("请假申请信息不符合规范！");
        }
        // 获取请假学生信息
        UserInfo userInfo = userService.getStudentInfo(applyLeaveForm.getUserId());
        LeaveInfo leaveInfo = new LeaveInfo();
        leaveInfo.setUuid(UUIDCreater.createUUID());
        leaveInfo.setUserId(userInfo.getUserId());
        leaveInfo.setUserName(userInfo.getUserName());
        leaveInfo.setMajor(userInfo.getMajor());
        leaveInfo.setInstructorId(userInfo.getInstructorId());
        leaveInfo.setStartTime(LeaveDateUtil.getStartTime(applyLeaveForm.getLeaveTime()));
        leaveInfo.setEndTime(LeaveDateUtil.getEndTime(applyLeaveForm.getLeaveTime()));
        leaveInfo.setReason(applyLeaveForm.getReason());
        leaveInfo.setStatus(NOREAD);
        log.info("请假申请最终参数组装,result:{}", leaveInfo);
        int i = userService.addLeaveInfo(leaveInfo);
        if (i != 1) {
            throw new ErrorInfoException("添加请假申请异常！");
        }
        // 成功添加完成请假申请后，查询个人所有请假申请记录，并跳转到申请记录页面
        List<LeaveRecordVo> lr = userService.getLeaveRecord(applyLeaveForm.getUserId());
        log.info("查询个人请假申请记录,result:{}", lr);
        session.setAttribute("lr", lr);
        return "/leaveRecord";
    }

    @GetMapping("/allLeaveRecord")
    public String allLeaveRecord(String userId, HttpSession session) throws ErrorInfoException {
        List<LeaveRecordVo> lr = userService.getLeaveRecord(userId);
        log.info("查询个人请假申请记录,result:{}", lr);
        session.setAttribute("lr", lr);
        return "/leaveRecord";
    }

    @GetMapping("/agree")
    public String agree(String uuid, HttpServletRequest request, HttpSession session) throws ErrorInfoException {
        int i = userService.agreeApply(uuid);
        if (i != 1) {
            throw new ErrorInfoException("同意请求失败！");
        }
        // 同意成功之后，查询该学生当天有无旷课记录，有的话状态改为事假
        WetherLeave wetherLeave = userService.getPersonLeaveInfo(uuid);
        log.info("同意请假申请后，查询学生当天的请假信息,result:{}", wetherLeave);
        if (wetherLeave != null) {
            LeaveTime leaveTime = new LeaveTime();
            leaveTime.setUserId(wetherLeave.getUserId());
            leaveTime.setStartTime(wetherLeave.getStartTime());
            leaveTime.setEndTime(wetherLeave.getEndTime());
            String id = userService.getPersonAbsenceInfo(leaveTime);
            log.info("同意请假申请后，查询学生当天的缺席信息,result:{}", id);
            if (id != null) {
                userService.updateRecord(id);
            }
        }
        String userId = String.valueOf(request.getSession().getAttribute("userId"));
        log.info("同意请假申请,param:{},{}", uuid, userId);
        List<LeaveApplyVo> la = userService.getApplyRecord(userId);
        log.info("查询所有学生的请假申请信息,result:{}", la);
        session.setAttribute("la", la);
        return "/mainViewTeacher";
    }

    @GetMapping("/refuse")
    public String refuse(String uuid, HttpServletRequest request, HttpSession session) throws ErrorInfoException {
        int i = userService.refuseApply(uuid);
        if (i != 1) {
            throw new ErrorInfoException("拒绝请求失败！");
        }
        String userId = String.valueOf(request.getSession().getAttribute("userId"));
        log.info("同意请假申请,param:{},{}", uuid, userId);
        List<LeaveApplyVo> la = userService.getApplyRecord(userId);
        log.info("查询所有学生的请假申请信息,result:{}", la);
        session.setAttribute("la", la);
        return "/mainViewTeacher";
    }

    @GetMapping("/updateInfo")
    public String updateInfo(String userId, HttpSession session) throws ErrorInfoException {
        log.info("修改用户信息，获取用户信息,param:{}", userId);
        AllUserInfoVo auv = userService.selectUserInfo(userId);
        if (auv == null) {
            throw new ErrorInfoException("修改用户信息，获取改用户信息失败！");
        }
        log.info("修改用户信息，获取用户信息,result:{}", auv);
        session.setAttribute("auv", auv);
        return "/updateUserInfo";
    }

    @PostMapping("/updateUserInfo")
    public String updateUserInfo(UpdateForm updateForm, HttpSession session) throws ErrorInfoException {
        log.info("修改用户信息，表单填写信息,param:{}", updateForm);
        User user = new User();
        user.setUserId(updateForm.getUserId());
        user.setUserName(updateForm.getUserName());
        user.setPassword(updateForm.getPassword());
        user.setMajor(updateForm.getMajor());
        log.info("修改用户信息,user参数组装,result:{}", user);
        Center center = new Center();
        center.setUserId(updateForm.getUserId());
        center.setUserName(updateForm.getUserName());
        center.setAge(updateForm.getAge());
        center.setSex(updateForm.getSex());
        center.setMajor(updateForm.getMajor());
        center.setPhone(updateForm.getPhone());
        center.setEmail(updateForm.getEmail());
        log.info("修改用户信息,center参数组装,result:{}", center);
        int m = userService.updateUser(user);
        int n = userService.updateCenter(center);
        if (m + n != 2) {
            throw new ErrorInfoException("修改用户信息异常！");
        }
        List<AllUserInfoVo> lau = userService.selectAllUserInfo();
        log.info("查询所有用户信息,result:{}", lau);
        session.setAttribute("lau", lau);
        return "/mainViewMaster";
    }

    @RequestMapping("/addNewUser")
    public String addNewUser() {
        // 添加新用户页面跳转
        return "/addNewUser";
    }

    @PostMapping("/addNewUserInfo")
    public String addNewUserInfo(AddUserForm addUserForm, HttpSession session) throws ErrorInfoException {
        log.info("新增用户信息,param:{}", addUserForm);
        User user = new User();
        user.setUserId(addUserForm.getUserId());
        user.setUserName(addUserForm.getUserName());
        user.setPassword(PWD);
        user.setInstructorId(INSTRUCTORID);
        user.setMajor(addUserForm.getMajor());
        user.setRole(ROLE);
        log.info("组装后用户表信息,result:{}", user);
        Center center = new Center();
        center.setUserId(addUserForm.getUserId());
        center.setUserName(addUserForm.getUserName());
        center.setAge(addUserForm.getAge());
        center.setSex(addUserForm.getSex());
        center.setMajor(addUserForm.getMajor());
        center.setPhone(addUserForm.getPhone());
        center.setEmail(addUserForm.getEmail());
        log.info("组装好的个人中心表信息,result:{}", center);
        int m = userService.addUser(user);
        int n = userService.addCenter(center);
        if (m + n != 2) {
            throw new ErrorInfoException("添加用户信息失败！");
        }
        List<AllUserInfoVo> lau = userService.selectAllUserInfo();
        log.info("查询所有用户信息,result:{}", lau);
        session.setAttribute("lau", lau);
        return "/mainViewMaster";
    }

    @GetMapping("/deleteUser")
    public String deleteUser(String userId, HttpSession session) throws ErrorInfoException {
        log.info("删除用户信息,param:{}", userId);
        int m = userService.deleteUser(userId);
        int n = userService.deleteCenter(userId);
        if (m + n != 2) {
            throw new ErrorInfoException("删除用户信息失败！");
        }
        List<AllUserInfoVo> lau = userService.selectAllUserInfo();
        log.info("查询所有用户信息,result:{}", lau);
        session.setAttribute("lau", lau);
        return "/mainViewMaster";
    }

    @GetMapping("/upload")
    public String upload() {
        return "upload";
    }

    @PostMapping("/upload")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile file) {
        log.info("++++++++++++++++++++++++++++++++++++++++++++++");
        if (file.isEmpty()) {
            return "上传失败，请选择文件";
        }

        String fileName = file.getOriginalFilename();
        String filePath = "C:\\Users\\code_bear\\Desktop";
        File dest = new File(filePath + fileName);
        try {
            file.transferTo(dest);
            log.info("上传成功");
            return "上传成功";
        } catch (IOException e) {
            log.error(e.toString(), e);
        }
        return "上传失败！";
    }

    @Transactional
    @RequestMapping("/xxxx")
    public void xxx() {
        // 添加新用户页面跳转
        userMapper.editTest();
        String a = null;
        if (a.equals("ewew")) {
            System.out.println("---------------------");
        }

    }

    @RequestMapping("indexxx")
    public String indexxx() {
        return "index";

    }

}