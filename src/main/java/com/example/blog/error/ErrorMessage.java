package com.example.blog.error;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class ErrorMessage<T> {
    //成功code码
    public static final Integer OK = 0;
    //失败code码
    public static final Integer ERROR = 100;

    private Integer code;       //code码
    private String message;     //异常信息
}