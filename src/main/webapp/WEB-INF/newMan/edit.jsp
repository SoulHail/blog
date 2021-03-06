
<%--
  Created by IntelliJ IDEA.
  User: code_bear
  Date: 2019/8/6
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>新人活动管理</title>

    <style>
        .switch {
            position: relative;
            float: left;
            width: 90px;
            margin: 0;
            -webkit-user-select:none;
            -moz-user-select:none;
            -ms-user-select: none;
        }

        .switch-checkbox {
            display: none;
        }

        .switch-label {
            display: block;
            overflow: hidden;
            cursor: pointer;
            border: 1px solid #999999;
            border-radius: 20px;
        }

        .switch-inner {
            display: block;
            width: 200%;
            margin-left: -100%;
            transition: margin 0.3s ease-in 0s;
        }

        .switch-inner::before, .switch-inner::after {
            display: block;
            float: right;
            width: 50%;
            height: 30px;
            padding: 0;
            line-height: 30px;
            font-size: 14px;
            color: white;
            font-family:
                    Trebuchet, Arial, sans-serif;
            font-weight: bold;
            box-sizing: border-box;
        }

        .switch-inner::after {
            content: attr(data-on);
            padding-left: 10px;
            background-color: #019FE8;
            color: #FFFFFF;
        }

        .switch-inner::before {
            content: attr(data-off);
            padding-right: 10px;
            background-color: #EEEEEE;
            color: #999999;
            text-align: right;
        }

        .switch-switch {
            position: absolute;
            display: block;
            width: 22px;
            height: 22px;
            margin: 4px;
            background: #FFFFFF;
            top: 0;
            bottom: 0;
            right: 56px;
            border: 1px solid #999999;
            border-radius: 20px;
            transition: all 0.3s ease-in 0s;
        }

        .switch-checkbox:checked + .switch-label .switch-inner {
            margin-left: 0;
        }

        .switch-checkbox:checked + .switch-label .switch-switch {
            right: 0px;
        }

    </style>

</head>
<body class="no-skin ">
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-content ">
        <div class="main-content-inner ">

            <div class="page-content ">
                <div class="row">
                    <div class=" widget-container-col ui-sortable  ">
                        <div class="widget-box widget-color-normal3" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 修改
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a></span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">

                                        <form class="form-inline form-horizontal"
                                              action="${ctx}/mpos/newUserAct/edit" id="searchForm"
                                              method="post" enctype ="multipart/form-data">
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">新人活动标题</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <input class="form-control input-small width-200px view-control" name="title" id="title" value="${newUserActDomain.title}">
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" name="title" id="title" value="${newUserActDomain.title}">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-400px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">起止时间</label>
                                                    <div class="col-sm-8  no-padding" style="width: 400px;">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <input readonly type="text" id="registerStartTime" name="registerStartTime" class="form-control input-small width-200px"
                                                                   data-placement="bottom" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                                   value="<fmt:formatDate value="${newUserActDomain.promotionStartTime}" pattern="yyyy-MM-dd HH:mm:ss" />">&nbsp;&nbsp;至&nbsp;&nbsp;
                                                            <input readonly type="text" id="registerEndTime" name="registerEndTime" class="form-control input-small width-200px"
                                                                   data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                                   value="<fmt:formatDate value="${newUserActDomain.promotionEndTime}" pattern="yyyy-MM-dd HH:mm:ss" />">
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input readonly disabled type="text" id="registerStartTime" name="registerStartTime" class="form-control input-small width-200px"
                                                                   data-placement="bottom" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                                   value="<fmt:formatDate value="${newUserActDomain.promotionStartTime}" pattern="yyyy-MM-dd HH:mm:ss" />">&nbsp;&nbsp;至&nbsp;&nbsp;
                                                            <input readonly type="text" id="registerEndTime" name="registerEndTime" class="form-control input-small width-200px"
                                                                   data-placement="bottom"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" style="width: 170px !important;"
                                                                   value="<fmt:formatDate value="${newUserActDomain.promotionEndTime}" pattern="yyyy-MM-dd HH:mm:ss" />">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <%-- 分界线 --%>
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <fieldset style="margin-top: 30px;">
                                                        <legend></legend>
                                                    </fieldset>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">注册有礼</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <%String registerSwitch = (String) session.getAttribute("registerSwitch"); %>
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <div class="switch">
                                                                <input class="switch-checkbox" id="registerSwitch" type="checkbox" <%="01".equals(registerSwitch)?"checked":"" %> onclick="rSwitch()">
                                                                <label class="switch-label" for="registerSwitch">
                                                                    <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                    <span class="switch-switch"></span>
                                                                </label>
                                                                <input hidden type="text" id="rtext" name="rtext" value="${newUserActDomain.registerSwitch}">
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <div class="switch">
                                                                <input disabled class="switch-checkbox" id="registerSwitch" type="checkbox" <%="01".equals(registerSwitch)?"checked":"" %> onclick="rSwitch()">
                                                                <label class="switch-label" for="registerSwitch">
                                                                    <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                    <span class="switch-switch"></span>
                                                                </label>
                                                                <input hidden type="text" id="rtext" name="rtext" value="${newUserActDomain.registerSwitch}">
                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">类型</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String registerType = (String) session.getAttribute("registerType"); %>
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.registerSwitch=='01'}">
                                                                <select data-placeholder="请选择" name="registerType" id="registerType" class="chosen-select form-control " style="width: 150px">
                                                                    <option value="" <%="".equals(registerType)?"selected":"" %> >请选择</option>
                                                                    <option value="1" <%="1".equals(registerType)?"selected":"" %> >优惠券</option>
                                                                    <option value="2" <%="2".equals(registerType)?"selected":"" %> >优惠券包</option>
                                                                    <option value="3" <%="3".equals(registerType)?"selected":"" %> >VIP体验卡</option>
                                                                    <option value="4" <%="4".equals(registerType)?"selected":"" %> >VIP月卡</option>
                                                                    <option value="5" <%="5".equals(registerType)?"selected":"" %> >VIP年卡</option>
                                                                </select>
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.registerSwitch=='00'}">
                                                                <select disabled data-placeholder="请选择" name="registerType" id="registerType" class="chosen-select form-control " style="width: 150px">
                                                                    <option value="" <%="".equals(registerType)?"selected":"" %> >请选择</option>
                                                                    <option value="1" <%="1".equals(registerType)?"selected":"" %> >优惠券</option>
                                                                    <option value="2" <%="2".equals(registerType)?"selected":"" %> >优惠券包</option>
                                                                    <option value="3" <%="3".equals(registerType)?"selected":"" %> >VIP体验卡</option>
                                                                    <option value="4" <%="4".equals(registerType)?"selected":"" %> >VIP月卡</option>
                                                                    <option value="5" <%="5".equals(registerType)?"selected":"" %> >VIP年卡</option>
                                                                </select>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <select disabled data-placeholder="请选择" name="registerType" id="registerType" class="chosen-select form-control " style="width: 150px">
                                                                <option value="" <%="".equals(registerType)?"selected":"" %> >请选择</option>
                                                                <option value="1" <%="1".equals(registerType)?"selected":"" %> >优惠券</option>
                                                                <option value="2" <%="2".equals(registerType)?"selected":"" %> >优惠券包</option>
                                                                <option value="3" <%="3".equals(registerType)?"selected":"" %> >VIP体验卡</option>
                                                                <option value="4" <%="4".equals(registerType)?"selected":"" %> >VIP月卡</option>
                                                                <option value="5" <%="5".equals(registerType)?"selected":"" %> >VIP年卡</option>
                                                            </select>
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">券/券包ID</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.registerSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" name="registerCouponId" id="registerCouponId" value="${newUserActDomain.registerCouponId}">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.registerSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" name="registerCouponId" id="registerCouponId" value="${newUserActDomain.registerCouponId}">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" name="registerCouponId" id="registerCouponId" value="${newUserActDomain.registerCouponId}">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6"
                                                           class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">奖励名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.registerSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" name="registerTip" id="registerTip" value="${newUserActDomain.registerTip}">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.registerSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" name="registerTip" id="registerTip" value="${newUserActDomain.registerTip}">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" name="registerTip" id="registerTip" value="${newUserActDomain.registerTip}">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">引导文案</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.registerSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" name="registerSubTip" id="registerSubTip" value="${newUserActDomain.registerSubTip}">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.registerSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" name="registerSubTip" id="registerSubTip" value="${newUserActDomain.registerSubTip}">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" name="registerSubTip" id="registerSubTip" value="${newUserActDomain.registerSubTip}">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">推送消息</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.registerSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" name="registerPushMsgId" id="registerPushMsgId" value="${newUserActDomain.registerPushMsgId}">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.registerSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" name="registerPushMsgId" id="registerPushMsgId" value="${newUserActDomain.registerPushMsgId}">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" name="registerPushMsgId" id="registerPushMsgId" value="${newUserActDomain.registerPushMsgId}">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>


                                            <%-- 分界线 --%>
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <fieldset style="margin-top: 30px;">
                                                        <legend></legend>
                                                    </fieldset>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">引导有礼</label>
                                                    <%String guideSwitch = (String) session.getAttribute("guideSwitch"); %>
                                                    <c:if test="${newUserActDomain.status==1}">
                                                        <div class="switch">
                                                            <input class="switch-checkbox" id="guideSwitch" type="checkbox" <%="01".equals(guideSwitch)?"checked":"" %> onclick="gSwitch()">
                                                            <label class="switch-label" for="guideSwitch">
                                                                <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                <span class="switch-switch"></span>
                                                            </label>
                                                            <input hidden type="text" id="gtext" name="gtext" value="${newUserActDomain.guideSwitch}">
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${newUserActDomain.status==2}">
                                                        <div class="switch">
                                                            <input disabled class="switch-checkbox" id="guideSwitch" type="checkbox" <%="01".equals(guideSwitch)?"checked":"" %> onclick="gSwitch()">
                                                            <label class="switch-label" for="guideSwitch">
                                                                <span class="switch-inner" data-on="启用" data-off="停用"></span>
                                                                <span class="switch-switch"></span>
                                                            </label>
                                                            <input hidden type="text" id="gtext" name="gtext" value="${newUserActDomain.guideSwitch}">
                                                        </div>
                                                    </c:if>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">类型</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String guideType = (String) session.getAttribute("guideType"); %>
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.guideSwitch=='01'}">
                                                                <select data-placeholder="请选择" name="guideType" id="guideType" class="chosen-select form-control " style="width: 150px">
                                                                    <option value="" <%="".equals(guideType)?"selected":"" %> >请选择</option>
                                                                    <option value="1" <%="1".equals(guideType)?"selected":"" %> >优惠券</option>
                                                                    <option value="2" <%="2".equals(guideType)?"selected":"" %> >优惠券包</option>
                                                                    <option value="3" <%="3".equals(guideType)?"selected":"" %> >VIP体验卡</option>
                                                                    <option value="4" <%="4".equals(guideType)?"selected":"" %> >VIP月卡</option>
                                                                    <option value="5" <%="5".equals(guideType)?"selected":"" %> >VIP年卡</option>
                                                                </select>
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.guideSwitch=='00'}">
                                                                <select disabled data-placeholder="请选择" name="guideType" id="guideType" class="chosen-select form-control " style="width: 150px">
                                                                    <option value="" <%="".equals(guideType)?"selected":"" %> >请选择</option>
                                                                    <option value="1" <%="1".equals(guideType)?"selected":"" %> >优惠券</option>
                                                                    <option value="2" <%="2".equals(guideType)?"selected":"" %> >优惠券包</option>
                                                                    <option value="3" <%="3".equals(guideType)?"selected":"" %> >VIP体验卡</option>
                                                                    <option value="4" <%="4".equals(guideType)?"selected":"" %> >VIP月卡</option>
                                                                    <option value="5" <%="5".equals(guideType)?"selected":"" %> >VIP年卡</option>
                                                                </select>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <select disabled data-placeholder="请选择" name="guideType" id="guideType" class="chosen-select form-control " style="width: 150px">
                                                                <option value="" <%="".equals(guideType)?"selected":"" %> >请选择</option>
                                                                <option value="1" <%="1".equals(guideType)?"selected":"" %> >优惠券</option>
                                                                <option value="2" <%="2".equals(guideType)?"selected":"" %> >优惠券包</option>
                                                                <option value="3" <%="3".equals(guideType)?"selected":"" %> >VIP体验卡</option>
                                                                <option value="4" <%="4".equals(guideType)?"selected":"" %> >VIP月卡</option>
                                                                <option value="5" <%="5".equals(guideType)?"selected":"" %> >VIP年卡</option>
                                                            </select>
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">券/券包ID</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.guideSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" value="${newUserActDomain.guideCouponId}" name="guideCouponId" id="guideCouponId">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.guideSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guideCouponId}" name="guideCouponId" id="guideCouponId">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guideCouponId}" name="guideCouponId" id="guideCouponId">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">引导类型</label>
                                                    <div class="col-sm-8  no-padding" style="width: 150px">
                                                        <%String guidePayType = (String) session.getAttribute("guidePayType"); %>
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.guideSwitch=='01'}">
                                                                <select data-placeholder="请选择" name="guidePayType" id="guidePayType" class="chosen-select form-control " style="width: 150px">
                                                                    <option value="" <%="".equals(guidePayType)?"selected":"" %> >请选择</option>
                                                                    <option value="1" <%="1".equals(guidePayType)?"selected":"" %> >刷卡</option>
                                                                    <option value="2" <%="2".equals(guidePayType)?"selected":"" %> >手机闪付</option>
                                                                    <option value="3" <%="3".equals(guidePayType)?"selected":"" %> >二维码</option>
                                                                </select>
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.guideSwitch=='00'}">
                                                                <select disabled data-placeholder="请选择" name="guidePayType" id="guidePayType" class="chosen-select form-control " style="width: 150px">
                                                                    <option value="" <%="".equals(guidePayType)?"selected":"" %> >请选择</option>
                                                                    <option value="1" <%="1".equals(guidePayType)?"selected":"" %> >刷卡</option>
                                                                    <option value="2" <%="2".equals(guidePayType)?"selected":"" %> >手机闪付</option>
                                                                    <option value="3" <%="3".equals(guidePayType)?"selected":"" %> >二维码</option>
                                                                </select>
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <select disabled data-placeholder="请选择" name="guidePayType" id="guidePayType" class="chosen-select form-control " style="width: 150px">
                                                                <option value="" <%="".equals(guidePayType)?"selected":"" %> >请选择</option>
                                                                <option value="1" <%="1".equals(guidePayType)?"selected":"" %> >刷卡</option>
                                                                <option value="2" <%="2".equals(guidePayType)?"selected":"" %> >手机闪付</option>
                                                                <option value="3" <%="3".equals(guidePayType)?"selected":"" %> >二维码</option>
                                                            </select>
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">引导金额</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.guideSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" value="${newUserActDomain.guidePayAmount}" name="guidePayAmount" id="guidePayAmount">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.guideSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guidePayAmount}" name="guidePayAmount" id="guidePayAmount">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guidePayAmount}" name="guidePayAmount" id="guidePayAmount">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">奖励名称</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.guideSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" value="${newUserActDomain.guideTip}" name="guideTip" id="guideTip">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.guideSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guideTip}" name="guideTip" id="guideTip">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guideTip}" name="guideTip" id="guideTip">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">引导文案</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.guideSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" value="${newUserActDomain.guideSubTip}" name="guideSubTip" id="guideSubTip">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.guideSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guideSubTip}" name="guideSubTip" id="guideSubTip">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guideSubTip}" name="guideSubTip" id="guideSubTip">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">推送消息</label>
                                                    <div class="col-sm-8  no-padding">
                                                        <c:if test="${newUserActDomain.status==1}">
                                                            <c:if test="${newUserActDomain.guideSwitch=='01'}">
                                                                <input class="form-control input-small width-200px view-control" value="${newUserActDomain.guidePushMsgId}" name="guidePushMsgId" id="guidePushMsgId">
                                                            </c:if>
                                                            <c:if test="${newUserActDomain.guideSwitch=='00'}">
                                                                <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guidePushMsgId}" name="guidePushMsgId" id="guidePushMsgId">
                                                            </c:if>
                                                        </c:if>
                                                        <c:if test="${newUserActDomain.status==2}">
                                                            <input disabled class="form-control input-small width-200px view-control" value="${newUserActDomain.guidePushMsgId}" name="guidePushMsgId" id="guidePushMsgId">
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>

                                            <button class="btn btn-info btn-sm" type="button" onclick="finalCheck('${newUserActDomain.id}')" >
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>确定
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="closes()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>取消
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row col-sm-12">
                        <div class="col-sm-4 hidden-480 left">
                            <label class="dataTables_info " id="dynamic-table_info"
                                   role="status" aria-live="polite"></label>
                        </div>
                        <div class="col-sm-8 right">
                            <%@include file="../layout/pagination.jsp"%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /.main-content -->
</div>


<!-- /.main-container -->
<%@include file="../layout/common.js.jsp"%>
<script src="../../jquery.min.js"></script>
<script type="text/javascript">

    function closes(){
        parent.$.fancybox.close();
    }

    function rSwitch() {

        if ($("#registerSwitch").is(':checked')) {
            $("input[id='rtext']").val("01");
            $("#registerType").removeAttr("disabled");
            $("#registerCouponId").removeAttr("disabled");
            $("#registerTip").removeAttr("disabled");
            $("#registerSubTip").removeAttr("disabled");
            $("#registerPushMsgId").removeAttr("disabled");
        } else {
            $("input[id='rtext']").val("00");
            $("#registerType").attr("disabled", true);
            $("#registerCouponId").attr("disabled", true);
            $("#registerTip").attr("disabled", true);
            $("#registerSubTip").attr("disabled", true);
            $("#registerPushMsgId").attr("disabled", true);
            $("#registerType").val("");
            $("#registerCouponId").val("");
            $("#registerTip").val("");
            $("#registerSubTip").val("");
            $("#registerPushMsgId").val("");
        }

    }

    function gSwitch() {

        if ($("#guideSwitch").is(':checked')) {
            $("input[id='gtext']").val("01");
            $("#guideType").removeAttr("disabled");
            $("#guideCouponId").removeAttr("disabled");
            $("#guidePayType").removeAttr("disabled");
            $("#guidePayAmount").removeAttr("disabled");
            $("#guideTip").removeAttr("disabled");
            $("#guideSubTip").removeAttr("disabled");
            $("#guidePushMsgId").removeAttr("disabled");
        } else {
            $("input[id='gtext']").val("00");
            $("#guideType").attr("disabled", true);
            $("#guideCouponId").attr("disabled", true);
            $("#guidePayType").attr("disabled", true);
            $("#guidePayAmount").attr("disabled", true);
            $("#guideTip").attr("disabled", true);
            $("#guideSubTip").attr("disabled", true);
            $("#guidePushMsgId").attr("disabled", true);
            $("#guideType").val("");
            $("#guideCouponId").val("");
            $("#guidePayType").val("");
            $("#guidePayAmount").val("");
            $("#guideTip").val("");
            $("#guideSubTip").val("");
            $("#guidePushMsgId").val("");
        }

    }


    function finalCheck(id){

        if($("#title").val().trim()==""){
            Modal.alert({
                msg:"请填写活动标题！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#registerStartTime").val()==""){
            Modal.alert({
                msg:"请选择活动开始时间！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        if($("#registerEndTime").val()==""){
            Modal.alert({
                msg:"请选择活动结束时间！",
                title: '提示',
                btnok: '确定',
                btncl: '取消'
            });
            return;
        }

        /* 加入checkbox开关判断，开启就进行非空判断,01开00关*/
        if($("#rtext").val()=="01"){

            if($("#registerType").val()==""){
                Modal.alert({
                    msg:"请选择类型！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#registerCouponId").val().trim()==""){
                Modal.alert({
                    msg:"请输入券/券包ID！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#registerTip").val().trim()==""){
                Modal.alert({
                    msg:"请输入奖励名称！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#registerSubTip").val().trim()==""){
                Modal.alert({
                    msg:"请输入引导文案！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#registerPushMsgId").val().trim()==""){
                Modal.alert({
                    msg:"请输入推送消息！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }
        }

        if($("#gtext").val()=="01"){

            if($("#guideType").val()==""){
                Modal.alert({
                    msg:"请选择类型！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#guideCouponId").val().trim()==""){
                Modal.alert({
                    msg:"请输入券/券包ID！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#guidePayType").val()==""){
                Modal.alert({
                    msg:"请选择引导类型！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#guidePayAmount").val().trim()==""){
                Modal.alert({
                    msg:"请输入引导金额！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#guideTip").val().trim()==""){
                Modal.alert({
                    msg:"请输入奖励名称！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#guideSubTip").val().trim()==""){
                Modal.alert({
                    msg:"请输入引导文案！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }

            if($("#guidePushMsgId").val().trim()==""){
                Modal.alert({
                    msg:"请输入推送消息！",
                    title: '提示',
                    btnok: '确定',
                    btncl: '取消'
                });
                return;
            }
        }

        f="true";

        if(f=="true"){
            sub(id);
        }
    }

    function sub(id){
        $.ajax({
            type:'post',
            url:'${ctx}/mpos/newUserAct/editSave?id=' + id,
            cache:false,
            async:false,
            data : {
                title : $("#title").val().trim(),
                registerSwitch : $("#rtext").val(),
                registerStartTime : $("#registerStartTime").val(),
                registerEndTime : $("#registerEndTime").val(),
                registerCouponId : $("#registerCouponId").val().trim(),
                registerType : $("#registerType").val(),
                registerTip : $("#registerTip").val().trim(),
                registerSubTip : $("#registerSubTip").val().trim(),
                registerPushMsgId : $("#registerPushMsgId").val().trim(),
                guideSwitch : $("#gtext").val(),
                guideType : $("#guideType").val(),
                guideCouponId : $("#guideCouponId").val().trim(),
                guidePayType : $("#guidePayType").val(),
                guidePayAmount : $("#guidePayAmount").val().trim(),
                guideTip : $("#guideTip").val().trim(),
                guideSubTip : $("#guideSubTip").val().trim(),
                guidePushMsgId : $("#guidePushMsgId").val().trim(),
            },
            success:function(result){
                if(result === "success"){
                    Modal.alert({
                        msg:"修改成功。"
                    }).on(function(e){
                        if(e===true){
                            parent.$.fancybox.close();
                            location.reload();
                        }
                    });
                }else {
                    Modal.alert({
                        msg:""+ result
                    });
                }
            }
        });
    }

</script>
</body>
</html>

