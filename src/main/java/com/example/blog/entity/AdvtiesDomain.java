package com.example.blog.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdvtiesDomain {
    private String uuid;
    private String page; // 页面类别
    private String pageType; // 页面类型 0:H5  1:Native
    private String code; // 广告编码
    private String name; // 广告名称
    private String iconUrl; // 广告图标地址
    private String adUrl; // 广告链接地址
    private String location; // 展示位置
    private String nativePageName; // 链接Native页面
    private String iosAudit; // 是否IOS审核
    private String isLogin; // 登录验证
    private String businessVerify; // 业务验证 01绑卡，02绑设备
    private String valid; // 是否有效 0无效,1有效:默认1
    private String sort; // 功能排序
    private String remark; // 备注
    private Date startTime; // 上线时间
    private Date endTime; // 下线时间
    private String creater; // 创建人
    private Date createdDate; // 创建时间
    private String updater; // 修改人
    private Date lastUpdated; // 修改时间
    private String deleteFlag; // 删除 0:正常 1：删除
}
