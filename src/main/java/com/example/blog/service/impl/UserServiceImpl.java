package com.example.blog.service.impl;


import com.example.blog.entity.*;
import com.example.blog.mapper.UserMapper;
import com.example.blog.service.UserService;
import com.example.blog.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public PersonalMessageVo getUserInfo(String userId) {
        return userMapper.getUserInfo(userId);
    }

    @Override
    public UserInfo getStudentInfo(String userId) {
        return userMapper.getStudentInfo(userId);
    }

    @Override
    public List<RecordVo> getRecord(String userId) {
        return userMapper.getRecord(userId);
    }

    @Override
    public int addAttendErrorInfo(AbsenceRecord absenceRecord) {
        return userMapper.addAttendErrorInfo(absenceRecord);
    }

    @Override
    public int addLeaveInfo(LeaveInfo leaveInfo) {
        return userMapper.addLeaveInfo(leaveInfo);
    }

    @Override
    public List<LeaveRecordVo> getLeaveRecord(String userId) {
        return userMapper.getLeaveRecord(userId);
    }

    @Override
    public List<LeaveApplyVo> getApplyRecord(String userId) {
        return userMapper.getApplyRecord(userId);
    }

    @Override
    public int agreeApply(String uuid) {
        return userMapper.agreeApply(uuid);
    }

    @Override
    public int refuseApply(String uuid) {
        return userMapper.refuseApply(uuid);
    }

    @Override
    public WetherLeave getPersonLeaveInfo(String uuid) {
        return userMapper.getPersonLeaveInfo(uuid);
    }

    @Override
    public String getPersonAbsenceInfo(LeaveTime leaveTime) {
        return userMapper.getPersonAbsenceInfo(leaveTime);
    }

    @Override
    public int updateRecord(String uuid) {
        return userMapper.updateRecord(uuid);
    }

    @Override
    public int selectCountInfo(IdAndDate idAndDate) {
        return userMapper.selectCountInfo(idAndDate);
    }

    @Override
    public List<AllUserInfoVo> selectAllUserInfo() {
        return userMapper.selectAllUserInfo();
    }

    @Override
    public AllUserInfoVo selectUserInfo(String userId) {
        return userMapper.selectUserInfo(userId);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int addCenter(Center center) {
        return userMapper.addCenter(center);
    }

    @Override
    public int deleteUser(String userId) {
        return userMapper.deleteUser(userId);
    }

    @Override
    public int deleteCenter(String userId) {
        return userMapper.deleteCenter(userId);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int updateCenter(Center center) {
        return userMapper.updateCenter(center);
    }
}
