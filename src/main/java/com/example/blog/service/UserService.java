package com.example.blog.service;



import com.example.blog.entity.*;
import com.example.blog.vo.*;

import java.util.List;

public interface UserService {
    /**
     * 根据学号来查询个人简介信息
     * @param userId
     * @return
     */
    PersonalMessageVo getUserInfo(String userId);

    /**
     * 获取学生信息
     * @param userId
     * @return
     */
    UserInfo getStudentInfo(String userId);

    /**
     * 获取学生个人的异常考勤记录
     * @param userId
     * @return
     */
    List<RecordVo> getRecord(String userId);

    /**
     * 添加学生考勤异常信息
     * @param absenceRecord
     * @return
     */
    int addAttendErrorInfo(AbsenceRecord absenceRecord);

    /**
     * 添加学生请假申请信息
     * @param leaveInfo
     * @return
     */
    int addLeaveInfo(LeaveInfo leaveInfo);

    /**
     * 通过学号查询自己的请假申请记录
     * @param userId
     * @return
     */
    List<LeaveRecordVo> getLeaveRecord(String userId);

    /**
     * 老师查询自己管理学生的请假申请记录
     * @param userId
     * @return
     */
    List<LeaveApplyVo> getApplyRecord(String userId);

    /**
     * 同意请假申请
     * @param uuid
     * @return
     */
    int agreeApply(String uuid);

    /**
     * 拒绝请假申请
     * @param uuid
     * @return
     */
    int refuseApply(String uuid);

    /**
     * 通过uuid查询请假表的学号，请假开始、结束时间
     * @param uuid
     * @return
     */
    WetherLeave getPersonLeaveInfo(String uuid);

    /**
     * 通过学号及请假时间检验缺席表是否有缺席记录
     * @param leaveTime
     * @return
     */
    String getPersonAbsenceInfo(LeaveTime leaveTime);

    /**
     * 通过uuid修改学生的缺席状态
     * @param uuid
     * @return
     */
    int updateRecord(String uuid);

    /**
     * 根据学号和日期查询请假表是否有请假记录
     * @param idAndDate
     * @return
     */
    int selectCountInfo(IdAndDate idAndDate);

    /**
     * 查询所有的系统用户信息
     * @return
     */
    List<AllUserInfoVo> selectAllUserInfo();

    /**
     * 根据学号查询用户信息
     * @param userId
     * @return
     */
    AllUserInfoVo selectUserInfo(String userId);

    /**
     * 添加User信息入库
     * @param user
     * @return
     */
    int addUser(User user);

    /**
     * 添加Center信息入库
     * @param center
     * @return
     */
    int addCenter(Center center);

    /**
     * 通过userId删除User表信息
     * @param userId
     * @return
     */
    int deleteUser(String userId);

    /**
     * 通过userId删除Center表信息
     * @param userId
     * @return
     */
    int deleteCenter(String userId);

    /**
     * 修改User表信息
     * @param user
     * @return
     */
    int updateUser(User user);

    /**
     * 修改Center表信息
     * @param center
     * @return
     */
    int updateCenter(Center center);
}
