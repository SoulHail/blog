package com.example.blog.error;

import lombok.Getter;
import lombok.Setter;

public class ErrorInfoException extends Exception {
    @Getter
    @Setter
    protected String message;

    public ErrorInfoException() {
        setMessage("Info is not right!");
    }

    public ErrorInfoException(String message) {
        this.message = message;
    }
}
