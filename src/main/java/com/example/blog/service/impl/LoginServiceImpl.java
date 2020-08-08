package com.example.blog.service.impl;

import com.example.blog.form.LoginForm;
import com.example.blog.mapper.LoginMapper;
import com.example.blog.service.LoginService;
import com.example.blog.vo.UserInfoVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    @Override
    public UserInfoVo login(LoginForm loginForm) {
        return loginMapper.login(loginForm);
    }
}
