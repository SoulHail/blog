package com.example.blog.controller;

import com.example.blog.entity.*;
import com.example.blog.util.UUIDCreater;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
public class EightController {

    @RequestMapping("daoru")
    public String daoru() {
        log.info("==============黑白名单主页面===============");
        return "list";
    }

    @RequestMapping("tj")
    public String tj() {
        log.info("==============黑白名单添加页面===============");
        return "add";
    }

    @RequestMapping("tjl")
    public String til() {
        log.info("==============黑白名单批量导入页面===============");
        return "addList";
    }

    @RequestMapping("sc")
    public String sc() {
        log.info("==============黑白名单批量删除页面===============");
        return "deleteList";
    }

    /******************************************************************************************************************/

    @RequestMapping("2list")
    public String list2(HttpSession session) {
        NewUserActDomain n1 = NewUserActDomain.builder()
                .id("1")
                .title("1")
                .status("1")
                .promotionStartTime(new Date())
                .promotionEndTime(new Date())
                .createTime(new Date())
                .enableStatus("1")
                .no(1)
                .build();

        NewUserActDomain n2 = NewUserActDomain.builder()
                .id("2")
                .title("2")
                .status("2")
                .promotionStartTime(new Date())
                .promotionEndTime(new Date())
                .createTime(new Date())
                .enableStatus("1")
                .no(2)
                .build();

        /*NewUserActDomain n3 = NewUserActDomain.builder()
                .id("3")
                .title("3")
                .status("2")
                .promotionStartTime(new Date())
                .promotionEndTime(new Date())
                .createTime(new Date())
                .enableStatus("2")
                .no(3)
                .build();

        NewUserActDomain n4 = NewUserActDomain.builder()
                .id("4")
                .title("4")
                .status("2")
                .promotionStartTime(new Date())
                .promotionEndTime(new Date())
                .createTime(new Date())
                .enableStatus("1")
                .no(4)
                .build();

        NewUserActDomain n5 = NewUserActDomain.builder()
                .id("5")
                .title("5")
                .status("3")
                .promotionStartTime(new Date())
                .promotionEndTime(new Date())
                .createTime(new Date())
                .enableStatus("2")
                .no(5)
                .build();

        NewUserActDomain n6 = NewUserActDomain.builder()
                .id("6")
                .title("6")
                .status("3")
                .promotionStartTime(new Date())
                .promotionEndTime(new Date())
                .createTime(new Date())
                .enableStatus("1")
                .no(6)
                .build();*/
        List<NewUserActDomain> list = new ArrayList<>();
        list.add(n1);
        list.add(n2);
        /*list.add(n3);
        list.add(n4);
        list.add(n5);
        list.add(n6);*/
        session.setAttribute("list", list);
        log.info("==============新人活动主页面===============");
        log.info("==============param:{}===============", list);
        return "list";
    }

    @RequestMapping("2add")
    public String add2(HttpSession session) {
        log.info("==============新人活动添加页面===============");
        session.setAttribute("r", "1");
        session.setAttribute("g", "2");
        return "add";
    }

    @RequestMapping("addSave")
    public String addSave(HttpServletRequest request, HttpSession session) {
        log.info("==============新人活动添加页面===============");
        NewUserActDomain newUserActDomain = NewUserActDomain.builder()
                .title(request.getParameter("title"))
                .registerSwitch(request.getParameter("registerSwitch"))
                //.registerStartTime(()request.getParameter("registerStartTime"))
                //.registerEndTime(request.getParameter("registerEndTime"))
                .registerType(request.getParameter("registerType"))
                .registerCouponId(request.getParameter("registerCouponId"))
                .registerTip(request.getParameter("registerTip"))
                .registerSubTip(request.getParameter("registerSubTip"))
                .guideSwitch(request.getParameter("guideSwitch"))
                .guideType(request.getParameter("guideType"))
                .guideCouponId(request.getParameter("guideCouponId"))
                .guideTip(request.getParameter("guideTip"))
                .guideSubTip(request.getParameter("guideSubTip"))
                .guidePayType(request.getParameter("guidePayType"))
                .guidePayAmount("231")
                .build();
        log.info("添加新人活动信息,param:{}", newUserActDomain);
        session.setAttribute("r", "1");
        session.setAttribute("g", "2");
        return "add";
    }

    @RequestMapping("2edit")
    public String edit2(HttpSession session) {
        NewUserActDomain newUserActDomain = NewUserActDomain.builder()
                .id("2131")
                .title("标题")
                .status("2")
                .promotionStartTime(new Date())
                .promotionEndTime(new Date())
                .registerSwitch("01")
                .registerType("2")
                .registerCouponId("21421312312")
                .registerTip("发的撒")
                .registerSubTip("斯蒂芬斯蒂芬")
                .registerPushMsgId("XXX")
                .guideSwitch("00")
                .guideType("3")
                .guideCouponId("2343242423")
                .guidePayType("2")
                .guidePayAmount("213")
                .guideTip("方式范德萨")
                .guideSubTip("发生的方式")
                .guidePushMsgId("XXX")
                .build();
        session.setAttribute("newUserActDomain", newUserActDomain);
        session.setAttribute("registerSwitch", "01");
        session.setAttribute("guideSwitch", "00");
        session.setAttribute("registerType", "2");
        session.setAttribute("guideType", "3");
        session.setAttribute("guidePayType", "2");
        log.info("==============新人活动修改页面===============");
        return "edit";
    }

    /******************************************************************************************************************/
    @RequestMapping("3list")
    public String list3() {
        log.info("==============任务配置中心主页面===============");
        return "list";
    }

    @RequestMapping("3add")
    public String add3() {
        log.info("==============任务配置中心添加页面===============");
        return "add";
    }

    @RequestMapping("3edit")
    public String edit3(HttpSession session) {
        NewHandDomain newHandDomain = NewHandDomain.builder()
                .taskModul("2")
                .taskName("dsad")
                .couponType("2")
                .couponId("342423")
                .taskCondition("2")
                .taskPic("asddsa")
                .awrdDescribe("sadsadsa")
                .jumpType("2")
                .jumpUrl("wqsfdfss")
                .loopType("1")
                .progress("1")
                .startTime("sads")
                .endTime("sda")
                .logoPic("dsads")
                .taskDescribe("sadsa")
                .taskPopupDescribe("Lflfdsflsdlfl")
                .build();
        session.setAttribute("newHandDomain", newHandDomain);
        session.setAttribute("task", "2");
        session.setAttribute("taskCondition", "2");
        session.setAttribute("couponType", "2");
        session.setAttribute("jumpType", "2");
        session.setAttribute("loopType", "1");
        session.setAttribute("progress", "1");
        log.info("==============任务配置中心添加页面===============");
        return "edit";
    }

    /******************************************************************************************************************/
    @RequestMapping("4list")
    public String list4() {
        log.info("==============app优化主页面===============");
        return "list";
    }

    @RequestMapping("4add")
    public String add4() {
        log.info("==============app优化添加页面===============");
        return "add";
    }

    /******************************************************************************************************************/
    @RequestMapping("5detail")
    public String detail() {
        log.info("==============任务详情页面===============");
        return "detail";
    }

    @RequestMapping("5add")
    public String add5(HttpSession session) {
        TaskDomain n = TaskDomain.builder()
                .rewardType("02")
                .build();
        session.setAttribute("n", n);
        log.info("==============添加页面===============");
        return "add";
    }

    /******************************************************************************************************************/
    @RequestMapping("9list")
    public String list9(HttpSession session) {
        List<AdvtiesDomain> list = new ArrayList<>();
        AdvtiesDomain a1 = AdvtiesDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .page("030")
                .name("功能1")
                .pageType("0")
                .adUrl("www.lianjie1")
                .iosAudit("0")
                .remark("啦啦啦")
                .startTime(new Date())
                .endTime(new Date())
                .createdDate(null)
                .creater("张三")
                .lastUpdated(new Date())
                .updater("李四")
                .build();
        AdvtiesDomain a2 = AdvtiesDomain.builder()
                .uuid(UUIDCreater.createUUID())
                .page("060")
                .name("功能2")
                .pageType("1")
                .adUrl("www.lianjie2")
                .iosAudit("1")
                .remark("啦啦啦")
                .startTime(new Date())
                .endTime(new Date())
                .createdDate(new Date())
                .creater("王五")
                .lastUpdated(new Date())
                .updater("赵六")
                .build();
        list.add(a1);
        list.add(a2);
        session.setAttribute("list", list);
        return "list";
    }

    @RequestMapping("9add")
    public String add9() {
        return "add";
    }

    @RequestMapping("9edit")
    public String edit9(HttpSession session) {
        AdvtiesDomain a = AdvtiesDomain.builder()
                .page("page_app_0002")
                .name("啦啦啦")
                .code("哈哈哈")
                .pageType("1")
                .iconUrl("www.iconUrl.com")
                .adUrl("www.adUrl.com")
                .nativePageName("呵呵呵")
                .sort("33")
                .iosAudit("1")
                .valid("1")
                .location("loc_choiceness")
                .isLogin("1")
                .startTime(new Date())
                .endTime(new Date())
                .remark("略略略")
                .build();
        session.setAttribute("result", a);
        session.setAttribute("page", "page_app_0002");
        session.setAttribute("pageType", "1");
        session.setAttribute("location", "loc_choiceness");
        session.setAttribute("iosAudit", "1");
        session.setAttribute("valid", "1");
        session.setAttribute("isLogin", "1");
        return "edit";
    }

    /******************************************************************************************************************/

    @RequestMapping("7list")
    public String list7(HttpSession session) {
        log.info("进入设备申请主页面");
        DeviceInfo d1 = DeviceInfo.builder()
                .inMno("700000000000001")
                .phone("13542565423")
                .applyTime(new Date())
                .protocolFlag("01")
                .activeUserCode("dasfsdasadasd")
                .build();

        DeviceInfo d2 = DeviceInfo.builder()
                .inMno("700000000000002")
                .phone("13542565423")
                .applyTime(new Date())
                .protocolFlag("02")
                .activeUserCode("dasfsdasadasd")
                .build();
        List<DeviceInfo> list = new ArrayList<>();
        list.add(d1);
        list.add(d2);
        session.setAttribute("list", list);
        return "list";
    }

    public String getIndex(HttpServletRequest request, HttpSession session) {
        String a = request.getParameter("index");
        String b = request.getParameter("name");

        return null;
    }

    private String cutString(String s) {
        return s.substring(0,1);
    }
}