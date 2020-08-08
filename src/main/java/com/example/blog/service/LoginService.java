package com.example.blog.service;

import com.example.blog.form.LoginForm;
import com.example.blog.vo.UserInfoVo;

public interface LoginService {
    /**
     * 用户登录
     * @param loginForm
     * @return
     */
    UserInfoVo login(LoginForm loginForm);
}
