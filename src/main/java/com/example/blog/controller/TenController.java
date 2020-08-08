package com.example.blog.controller;


import com.example.blog.entity.ten.*;
import com.example.blog.util.RegularEnum;
import com.example.blog.util.RegularUtil;
import com.example.blog.util.UUIDCreater;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
public class TenController {

    @RequestMapping("list1")
    public String list1(HttpSession session) {
        List<PointDomain> list = new ArrayList<>();
        PointDomain p1 = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("POINT_ONE")
                .pointLevel("1")
                .pointName("关卡一")
                .pointNum("1")
                .feeCode("FEE_ONE")
                .build();
        PointDomain p2 = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("POINT_TWO")
                .pointLevel("2")
                .pointName("关卡二")
                .pointNum("3")
                .feeCode("FEE_TWO")
                .build();
        PointDomain p3 = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("POINT_THREE")
                .pointLevel("3")
                .pointName("关卡三")
                .pointNum("10")
                .feeCode("FEE_THREE")
                .build();
        PointDomain p4 = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("POINT_ONE")
                .pointLevel("1")
                .pointName("关卡一")
                .pointNum("1")
                .feeCode("FEE_ONE")
                .build();
        list.add(p1);
        list.add(p2);
        list.add(p3);
        list.add(p4);
        session.setAttribute("list", list);
        return "list";
    }

    @RequestMapping("add1")
    public String add1(HttpServletRequest request) {
        return "add";
    }

    @RequestMapping("edit1")
    public String edit1(HttpSession session) {
        PointDomain p = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("JSD_DKSLF")
                .pointName("关卡10")
                .pointLevel("10")
                .pointNum("999")
                .feeCode("DJSJFKSKDLS")
                .build();
        session.setAttribute("result", p);
        return "edit";
    }

    /******************************************************************************************************************/

    @RequestMapping("list2")
    public String list2(HttpSession session) {

        session.setAttribute("userName", "1001");

        FeeDomain f1 = FeeDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .name("CODE_ONE")
                .desc("套餐一")
                .goodsId(UUIDCreater.createUUID())
                .goodsNm("等宽缩放")
                .debitRate("0.4")
                .creditRate("0.5")
                .settleFee("0.6")
                .duration("34")
                .status("1")
                .build();
        FeeDomain f2 = FeeDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .name("CODE_ONE")
                .desc("套餐一")
                .goodsId(UUIDCreater.createUUID())
                .goodsNm("等宽缩放")
                .debitRate("0.4")
                .creditRate("0.5")
                .settleFee("0.6")
                .duration("34")
                .packageType("02")
                .status("1")
                .build();
        FeeDomain f3 = FeeDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .name("CODE_ONE")
                .desc("套餐一")
                .goodsId(UUIDCreater.createUUID())
                .goodsNm("等宽缩放")
                .debitRate("0.4")
                .creditRate("0.5")
                .settleFee("0.6")
                .duration("34")
                .packageType("3")
                .status("0")
                .build();
        List<FeeDomain> list = new ArrayList<>();
        list.add(f1);
        list.add(f2);
        list.add(f3);
        session.setAttribute("list", list);
        return "list";
    }

    @RequestMapping("add2")
    public String add2(HttpServletRequest request) {
        return "add";
    }

    @RequestMapping("edit2")
    public String edit2(HttpSession session) {
        FeeDomain f3 = FeeDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .name("CODE_ONE")
                .desc("套餐一")
                .goodsId(UUIDCreater.createUUID())
                .goodsNm("等宽缩放")
                .debitRate("0.4")
                .creditRate("0.5")
                .settleFee("0.6")
                .duration("34")
                .packageType("3")
                .status("0")
                .build();
        session.setAttribute("result", f3);
        session.setAttribute("feeStatus", "0");
        session.setAttribute("feeType", "03");
        return "edit";
    }

    /******************************************************************************************************************/

    @RequestMapping("list3")
    public String list3(HttpSession session) {
        String a = "231qq.com";
        boolean flag = RegularUtil.checkRegularUtil(a, RegularEnum.EMAIL.getRule());
        log.info("==============flag:{}", flag);

        CurrentFee c = CurrentFee.builder()
                .inMno("7000000324232")
                .debitRate("0.55")
                .cardRate("0.33")
                .qrRate("0.38")
                .vipStatus("010")
                .vipDueDate("20190921")
                .build();
        session.setAttribute("listInfo", c);

        UserFeeDomain u1 = UserFeeDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .inMno("700000000011111")
                .feeName("白金卡")
                .feeCode("CODE_GOLD")
                .duration("90")
                .startTime("2019 01-21 13:49:23")
                .endTime("2019 01-21 13:49:23")
                .unUsedBetter("1")
                .status("1")
                .buildAction("盟友设定")
                .eventTime("2019 01-21 13:49:23")
                .event("过期作废")
                .eventDesc("颠三倒四")
                .build();
        UserFeeDomain u2 = UserFeeDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .inMno("700000000022222")
                .feeName("黄金卡")
                .feeCode("CODE_GOLD")
                .duration("30")
                .startTime("2019 01-21 13:49:23")
                .endTime("2019 01-21 13:49:23")
                .unUsedBetter("0")
                .status("2")
                .buildAction("发的撒")
                .eventTime("2019 01-21 13:49:23")
                .event("是法兰克福")
                .eventDesc("多少度")
                .build();
        UserFeeDomain u3 = UserFeeDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .inMno("700000000033333")
                .feeName("SVIP")
                .feeCode("CODE_SVIP")
                .duration("365")
                .startTime("2019 01-21 13:49:23")
                .endTime("2019 01-21 13:49:23")
                .unUsedBetter("1")
                .status("3")
                .buildAction("盟友设定")
                .eventTime("2019 01-21 13:49:23")
                .event("过期作废")
                .eventDesc("颠三倒四")
                .build();
        List<UserFeeDomain> list = Arrays.asList(u1, u2, u3);
        session.setAttribute("list", list);
        return "list";
    }

    /******************************************************************************************************************/

    @RequestMapping("list4")
    public String list4(HttpSession session) {
        InviteDomain i1 = InviteDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .beInvitePhone("13424588394")
                .actStatus("1")
                .actDate("2019 04-23 13:33:23")
                .beInviteBelong("1")
                .invitePhone("13249522324")
                .actNum("3")
                .inviteVipStatus("1")
                .allyStatus("1")
                .currentPoint("关卡二")
                .startTime("2019 04-23 13:33:23")
                .effectTime("2019 04-23 13:33:23")
                .build();
        InviteDomain i2 = InviteDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .beInvitePhone("13426668394")
                .actStatus("0")
                .actDate("2019 04-23 13:33:23")
                .beInviteBelong("0")
                .invitePhone("13249522324")
                .actNum("1")
                .inviteVipStatus("0")
                .allyStatus("0")
                .currentPoint("关卡一")
                .startTime("2019 04-23 13:33:23")
                .effectTime("2019 04-23 13:33:23")
                .build();
        InviteDomain i3 = InviteDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .beInvitePhone("13424588394")
                .actStatus("1")
                .actDate("2019 04-23 13:33:23")
                .beInviteBelong("1")
                .invitePhone("13249522324")
                .actNum("10")
                .inviteVipStatus("1")
                .allyStatus("1")
                .currentPoint("关卡三")
                .startTime("2019 04-23 13:33:23")
                .effectTime("2019 04-23 13:33:23")
                .build();
        List<InviteDomain> list = Arrays.asList(i1, i2, i3);
        session.setAttribute("list", list);
        return "list";
    }

    @RequestMapping("export")
    public String export() {
        return "showExport";
    }

    /******************************************************************************************************************/

    @RequestMapping("testee")
    public String testee(HttpSession session) {
        List<PointDomain> listData = new ArrayList<>();
        PointDomain p1 = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("POINT_ONE")
                .pointLevel("1")
                .pointName("关卡一")
                .pointNum("1")
                .feeCode("FEE_ONE")
                .build();
        PointDomain p2 = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("POINT_TWO")
                .pointLevel("2")
                .pointName("关卡二")
                .pointNum("3")
                .feeCode("FEE_TWO")
                .build();
        PointDomain p3 = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("POINT_THREE")
                .pointLevel("3")
                .pointName("关卡三")
                .pointNum("10")
                .feeCode("FEE_THREE")
                .build();
        PointDomain p4 = PointDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .pointCode("POINT_ONE")
                .pointLevel("1")
                .pointName("关卡一")
                .pointNum("1")
                .feeCode("FEE_ONE")
                .build();
        listData.add(p1);
        listData.add(p2);
        listData.add(p3);
        listData.add(p4);
        FeeDomain f3 = FeeDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .name("CODE_ONE")
                .desc("套餐一")
                .goodsId(UUIDCreater.createUUID())
                .goodsNm("等宽缩放")
                .debitRate("0.4")
                .creditRate("0.5")
                .settleFee("0.6")
                .duration("34")
                .packageType("3")
                .status("0")
                .build();
        List<FeeDomain> list = new ArrayList<>();
        list.add(f3);

        session.setAttribute("listData", listData);
        session.setAttribute("list", list);
        return "detailsInfo";
    }

    @RequestMapping("testtt")
    public String testtt(HttpSession session) {
        List<ExpandSilence> list = new ArrayList<>();
        ExpandSilence p1 = ExpandSilence.builder().inMno("7000000001").topOrgNo("top111111").orgId("org11111").expandTime(new Date()).expandResult("1").build();
        ExpandSilence p2 = ExpandSilence.builder().inMno("7000000002").topOrgNo("top222222").orgId("org22222").expandTime(new Date()).expandResult("2").build();
        ExpandSilence p3 = ExpandSilence.builder().inMno("7000000003").topOrgNo("top333333").orgId("org33333").expandTime(new Date()).expandResult("2").build();
        ExpandSilence p4 = ExpandSilence.builder().inMno("7000000004").topOrgNo("top444444").orgId("org44444").expandTime(new Date()).expandResult("1").build();
        list.add(p1);
        list.add(p2);
        list.add(p3);
        list.add(p4);
        session.setAttribute("list", list);
        return "list";
    }

    @RequestMapping("a_aaa")
    public String aaa1(HttpSession session) {
        List<UserCleanInfo> list = new ArrayList<>();
        UserCleanInfo u1 = UserCleanInfo.builder()
                .inMno("232")
                .idCard("432423")
                .hlsStatus("02")
                .userStatus("1")
                .optSource("2")
                .operator("Admin")
                .build();
        UserCleanInfo u2 = UserCleanInfo.builder()
                .inMno("232")
                .idCard("432423")
                .hlsStatus("02")
                .userStatus("1")
                .optSource("2")
                .optTime("2")
                .operator("Admin")
                .build();
        list.add(u1);
        list.add(u2);
        session.setAttribute("list", list);
        return "lista";
    }

    @RequestMapping("a_aa")
    public String aa(HttpSession session) {
        return "Add";
    }

    @RequestMapping("a_export")
    public void export(HttpServletRequest request, HttpSession session) {
        String inMno = request.getParameter("inMno");
        String optSource = request.getParameter("optSource");
        String optStartTime = request.getParameter("optStartTime");
        String optEndTime = request.getParameter("optEndTime");
        log.info("===============inMno:{},optSource:{},optStartTime:{},optEndTime:{}", inMno, optSource, optStartTime, optEndTime);
        /*UserCleanInfo u = new UserCleanInfo();
        u.setInMno(request.getParameter("inMno"));
        log.info("u:{}", u);
        if ("".equals(u.getInMno())) {
            System.out.println("a为空");
        }
        if (u.getInMno() == null) {
            System.out.println("a为null");
        }
        List<UserCleanInfo> list = (List<UserCleanInfo>) session.getAttribute("list");
        log.info("========list:{}", list);*/
    }

    /*****************************************************************************************************************************/

    @RequestMapping("u_list")
    public String ulist(HttpSession session) {
        session.setAttribute("list", new ArrayList<>());
        return "list";
    }

    @RequestMapping("u_list2")
    public String ulist2(HttpSession session) {
        session.setAttribute("list", new ArrayList<>());
        return "listInfo";
    }

    @RequestMapping("u_edit")
    public String uedit(HttpSession session) {
        return "edit";
    }

    @RequestMapping("u_edit2")
    public String uedit2(HttpSession session) {
        return "batchEdit";
    }

    @RequestMapping("testA")
    public String testA(HttpSession session) {
        return "list";
    }
}
