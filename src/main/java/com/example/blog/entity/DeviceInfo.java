package com.example.blog.entity;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class DeviceInfo {
    private String inMno;
    private String phone;
    private Date applyTime;
    private String protocolFlag;
    private String activeUserCode;
}
