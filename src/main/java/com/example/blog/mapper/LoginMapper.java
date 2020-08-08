package com.example.blog.mapper;


import com.example.blog.form.LoginForm;
import com.example.blog.vo.UserInfoVo;

public interface LoginMapper {
    /**
     * 查询登录信息
     * @param loginForm
     * @return
     */
    UserInfoVo login(LoginForm loginForm);
}
