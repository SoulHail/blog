<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../layout/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>随行付手刷平台</title>
    <style>
        body{margin:0 auto;min-width:320px;height:100%;background:#f5f5f9;font-size:14px;font-family:Helvetica,"Microsoft YaHei", Arial, Helvetica, sans-serif;line-height: 1.5;color:#535353;}

        .am-menu-offcanvas1 .am-menu-toggle {
            top: -32px;
        }

        h1, p, div {
            word-wrap: break-word;
            word-break: normal;
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
                                    <i class="ace-icon fa fa-table"></i> 查看任务详情
                                </h5>
                                <span class="widget-toolbar"> <a data-action="collapse"
                                                                 href="#"> <i class="ace-icon fa fa-chevron-up"></i>
									</a>
									</span>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal" id="addForm" method="post" enctype="multipart/form-data">
                                            <div class="col-xs-12">
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务模块:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <select placeholder="请选择" name="moduleCode" id="moduleCode" disabled class="findSpace form-control" style="width: 300px">
                                                            <option value="TC_TYPE_001" <c:if test="${taskDetail.moduleCode=='TC_TYPE_001'}">selected</c:if>>每日福利</option>
                                                            <option value="TC_TYPE_002" <c:if test="${taskDetail.moduleCode=='TC_TYPE_002'}">selected</c:if>>新手任务</option>
                                                            <option value="TC_TYPE_003" <c:if test="${taskDetail.moduleCode=='TC_TYPE_003'}">selected</c:if>>成长任务</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务名称:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input maxlength="20" name="taskName" id="taskName" value="${taskDetail.taskName}" readonly class="findSpace form-control" style="width: 300px" placeholder="最多输入20个字"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group" style="width: 450px">
                                                    <select data-placeholder="请选择" name="rewardType" id="rewardType" class="chosen-select form-control " style="width: 98px">
                                                        <option value="1" >优惠券ID</option>
                                                        <option value="2" >券包ID</option>
                                                    </select>
                                                    <input class="form-control input-small width-148px view-control" style="width: 148px" name="rewardId" id="rewardId">
                                                </div>
                                                <div class="form-group" style="width: 450px" >
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left"  >任务条件:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px" >
                                                        <span style="color: white">*</span>
                                                        <select placeholder="请选择" name="taskConditionId" disabled id="taskConditionId" class="findSpace form-control" style="width: 170px">
                                                            <option value="" >请选择</option>
                                                            <option value="TC0001" <c:if test="${taskDetail.taskConditionId=='TC0001'}">selected</c:if>>完成实名认证</option>
                                                            <option value="TC0002" <c:if test="${taskDetail.taskConditionId=='TC0002'}">selected</c:if>>完成信用卡绑定X张</option>
                                                            <option value="TC0003" <c:if test="${taskDetail.taskConditionId=='TC0003'}">selected</c:if>>完成储蓄卡绑定X张</option>
                                                            <option value="TC0004" <c:if test="${taskDetail.taskConditionId=='TC0004'}">selected</c:if>>完成设备绑定</option>
                                                            <option value="TC0005" <c:if test="${taskDetail.taskConditionId=='TC0005'}">selected</c:if>>体验一次小额双免</option>
                                                            <option value="TC0006" <c:if test="${taskDetail.taskConditionId=='TC0006'}">selected</c:if>>开通VIP</option>
                                                            <option value="TC0007" <c:if test="${taskDetail.taskConditionId=='TC0007'}">selected</c:if>>月云闪付X笔累计交易Y元</option>
                                                            <option value="TC0008" <c:if test="${taskDetail.taskConditionId=='TC0008'}">selected</c:if>>累计拉新X人</option>
                                                            <option value="TC0009" <c:if test="${taskDetail.taskConditionId=='TC0009'}">selected</c:if>>新增活动</option>
                                                            <option value="TC0010" <c:if test="${taskDetail.taskConditionId=='TC0010'}">selected</c:if>>首笔交易</option>
                                                            <option value="TC0011" <c:if test="${taskDetail.taskConditionId=='TC0011'}">selected</c:if>>观看视频</option>
                                                            <option value="TC0012" <c:if test="${taskDetail.taskConditionId=='TC0012'}">selected</c:if>>银联二维码交易X笔累计交易X元银联二维码交易X笔累计交易X元</option>
                                                        </select>
                                                        <input name="taskConditionNum" id="taskConditionNum" readonly value="${taskDetail.taskConditionNum}" class="findSpace form-control" style="width: 45px"> 张/笔/人 </input>
                                                        <input name="taskConditionMoney" id="taskConditionMoney" readonly value="${taskDetail.taskConditionMoney}"  class="findSpace form-control" style="width: 50px"> K </input>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">奖励内容描述:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <input type="file" style="display:none" onchange="rewardUploadFile(false)" id="rewardUpload" name="upload" value="上传">
                                                    </div>

                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input type="button" class="form-control input-small width-100px" onclick="rewardUploadclick();" value="上传小图标"/>
                                                        <input type="text" class="form-control input-small view-control"
                                                               id="rewardFileName" name="rewardFileName" readonly style="width: 60%;" value="${taskDetail.rewardFileName}"
                                                               data-placement="bottom" data-trigger="hover" data-rel="popover"/>
                                                    </div>
                                                    <br/>
                                                    <div class="col-sm-8">
                                                        <textarea style="height: 150px;width: 100%;margin-left: 100px" class="form-control"  name="rewardDesc" readonly id="rewardDesc">${taskDetail.rewardDesc}</textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">跳转类型:</label>
                                                    <div class="col-sm-10  no-padding" style="width: 350px" >
                                                        <span style="color: red">*</span>
                                                        <div class="radio" >
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="jumpCode" value="NATIVE" disabled <c:if test="${taskDetail.jumpCode=='NATIVE'}">checked</c:if>>本地</input>
                                                            </label>
                                                        </div>
                                                        <div class="radio" >
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="jumpCode" value="H5" disabled <c:if test="${taskDetail.jumpCode=='H5'}">checked</c:if>>h5页面</input>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">跳转链接:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input name="jumpUrl" id="jumpUrl" readonly value="${taskDetail.jumpUrl}" class="findSpace form-control" style="width: 300px" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group" style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">循环类型:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: red">*</span>
                                                        <select placeholder="请选择" name="loopType" id="loopType" disabled class="findSpace form-control" style="width: 170px">
                                                            <option value="01" <c:if test="${taskDetail.loopType=='01'}">selected</c:if>>一次性任务</option>
                                                            <option value="02" <c:if test="${taskDetail.loopType=='02'}">selected</c:if>>每日循环任务</option>
                                                            <option value="03" <c:if test="${taskDetail.loopType=='03'}">selected</c:if>>每月循环任务</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">展示进度:</label>
                                                    <div class="col-sm-10  no-padding" style="width: 350px" >
                                                        <span style="color: red">*</span>
                                                        <div class="radio" >
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="progressType" value="01" disabled <c:if test="${taskDetail.progressType=='01'}">checked</c:if> >是</input>
                                                            </label>
                                                        </div>

                                                        <div class="radio" >
                                                            <label class="col-sm-4 control-label  width-100px no-padding-left">
                                                                <input type="radio" name="progressType" value="02" disabled <c:if test="${taskDetail.progressType=='02'}">checked</c:if>>否</input>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">上线时间:</label>
                                                    <span style="color: red">*</span>
                                                    <div class="radio" >
                                                        <label
                                                                class="col-sm-4 control-label  width-100px no-padding-left" style="padding-top:1px;">
                                                            <input type="checkbox" name="starTimeRadio" disabled onclick="clickSatrTime()"/> 立即
                                                        </label>
                                                        <input type="text" id="onlineTimeAdd"
                                                               name="onlineTimeAdd" disabled value="${taskDetail.onlineTimeAdd}"
                                                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                               class="form-control input-small width-200px"
                                                               data-placement="bottom"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">下线时间:</label>
                                                    <span style="color: red">*</span>
                                                    <div class="radio" >
                                                        <label
                                                                class="col-sm-4 control-label  width-100px no-padding-left" style="padding-top:1px;">
                                                            <input type="checkbox" name="endTimeRadio" disabled onclick="clickEndTime()"/> 立即
                                                        </label>
                                                        <input type="text" id="offlineTimeAdd"
                                                               name="offlineTimeAdd" disabled value="${taskDetail.offlineTimeAdd}"
                                                               onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
                                                               class="form-control input-small width-200px"
                                                               data-placement="bottom"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">logo上传:</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <input type="file" style="display:none" onchange="logoUploadFile(false)" id="logoUpload" name="upload" value="上传">
                                                    </div>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: red">*</span>
                                                        <input type="button" class="form-control input-small width-100px" onclick="logoUploadclick();" value="上传文件"/>
                                                        <input type="text" class="form-control input-small view-control"
                                                               id="logoUrl" name="logoUrl" readonly style="width: 60%;" value="${taskDetail.logoUrl}"
                                                               data-placement="bottom" data-trigger="hover" data-rel="popover"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">logo预览:</label>
                                                    <div class="col-sm-8">
                                                        <img alt="logo预览" src="${taskDetail.logoUrl}" id="logoPic" height="120" width="120">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-top: 10px;">
                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">任务内容描述:</label>
                                                    <div class="col-sm-8">
                                                        <textarea style="height: 150px;width: 30%" class="form-control" name="taskDesc" id="taskDesc" readonly >${taskDetail.taskDesc}</textarea>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 col-sm-12 form-group-sm">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">奖励弹窗描述:</label>
                                                    <div class="col-sm-8">
                                                        <textarea style="height: 150px;width: 30%" class="form-control" name="taskAwardDesc" id="taskAwardDesc" readonly >${taskDetail.taskAwardDesc}</textarea>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">模块内排序：</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input class="findSpace form-control " style="width: 300px"
                                                               name="taskSortAdd" id="taskSortAdd" readonly value="${taskDetail.taskSortAdd}"
                                                               data-placement="bottom" data-trigger="hover"
                                                               data-rel="popover" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12">
                                                <div class="form-group  " style="width: 450px">
                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">备注：</label>
                                                    <div class="col-sm-10  no-padding " style="width: 350px">
                                                        <span style="color: white">*</span>
                                                        <input class="findSpace form-control " style="width: 300px"
                                                               name="remark" id="remark" readonly value="${taskDetail.remark}"
                                                               data-placement="bottom" data-trigger="hover"
                                                               data-rel="popover" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row center" style="margin-top: 3%;">
                                                <button class="btn btn-info btn-sm" type="button"
                                                        onclick="closes()">
												  <span
                                                          class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>
                                                    关闭
                                                </button>
                                            </div>
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
<script type="text/javascript">
    function closes(){
        parent.$.fancybox.close();
    }
</script>
</body>
</html>