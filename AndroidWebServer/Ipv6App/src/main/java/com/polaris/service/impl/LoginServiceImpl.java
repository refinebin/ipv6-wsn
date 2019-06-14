package com.polaris.service.impl;

import com.polaris.entity.SensorRecordEntity;
import com.polaris.mapper.LoginMapper;
import com.polaris.mapper.SensorRecordMapper;
import com.polaris.service.LoginService;
import com.polaris.util.Dbutil;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.List;

public class LoginServiceImpl implements LoginService{
    @Override
    public int checkPassword(String username,String passwd) throws IOException {
        Dbutil dbutil = new Dbutil();
        SqlSession sqlSession = dbutil.getSqlsession();
        LoginMapper loginMapper = sqlSession.getMapper(LoginMapper.class);
        String password = loginMapper.checkPassword(username);
        sqlSession.commit();
        sqlSession.close();
        if(passwd.equals(password)){
            return 0;
        }else {
            return 1;
        }
    }
}
