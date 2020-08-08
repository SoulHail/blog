package com.example.blog.error;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 全局异常
 */
@ControllerAdvice
public class GlobalExceptionHandle {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandle.class);

    @ExceptionHandler(ErrorInfoException.class)
    @ResponseBody
    public ErrorMessage<String> sessionNotFoundExceptionHandler(ErrorInfoException exception) throws Exception {
        logger.info("进行异常信息封装");
        return handleErrorInfo(exception.getMessage(), exception);
    }

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ErrorMessage<String> exceptionHandler(Exception exception) throws Exception {
        return handleErrorInfo(exception.getMessage(), exception);
    }

    private ErrorMessage<String> handleErrorInfo(String message, Exception exception) {
        ErrorMessage<String> errorMessage = new ErrorMessage<>();
        errorMessage.setMessage(message);
        errorMessage.setCode(ErrorMessage.ERROR);
        logger.info("返回异常信息{}",errorMessage);
        return errorMessage;
    }
}

