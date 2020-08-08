package com.example.blog.entity.ten;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ExpandSilence {
    private String inMno;
    private String topOrgNo;
    private String orgId;
    private Date expandTime;
    private String expandResult;
    private String failReason;
}
