package com.polaris.service.impl;

import com.polaris.entity.AreaEntity;
import com.polaris.entity.FireRecordEntity;
import com.polaris.mapper.AreaMapper;
import com.polaris.mapper.FireRecordMapper;
import com.polaris.util.Dbutil;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class FireRecordServiceImpl {
    public StringBuffer getAllFireRecordInfo() throws IOException {
        Dbutil dbutil = new Dbutil();
        SqlSession sqlSession = dbutil.getSqlsession();
        FireRecordMapper fireRecordMapper = sqlSession.getMapper(FireRecordMapper.class);
        List<FireRecordEntity> list = fireRecordMapper.getAllFireRecordInfo();
        sqlSession.commit();
        sqlSession.close();
        StringBuffer stringBuffer = new StringBuffer();
        Iterator<FireRecordEntity> iterator= list.iterator();
        while (iterator.hasNext()){
            FireRecordEntity fireRecordEntity = new FireRecordEntity();
            fireRecordEntity = iterator.next();
            String a = fireRecordEntity.getKindName();
            String b = fireRecordEntity.getCreateTime();
            String c = fireRecordEntity.getAreaName();
            stringBuffer.append(a).append("`").append(b).append("`").append(c).append("`").append("^");
        }
        System.out.println(stringBuffer.toString());
        return stringBuffer;
    }
}
