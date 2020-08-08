package com.example.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MposMemberMccType {
    private String uuid;
    private Integer sort; //展示顺序序号
    private String code; //mcc类别码
    private String codeName; //mcc类别名称
    private String mcc; //mcc码
    private String icon; //图片url
    private Date createDate; //创建时间
    private Date updateDate; //修改时间
    private String operator; //操作人
}
