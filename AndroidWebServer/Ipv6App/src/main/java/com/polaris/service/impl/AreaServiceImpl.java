package com.polaris.service.impl;

import com.polaris.entity.AreaEntity;
import com.polaris.entity.SensorRecordEntity;
import com.polaris.mapper.AreaMapper;
import com.polaris.mapper.SensorRecordMapper;
import com.polaris.util.Dbutil;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class AreaServiceImpl {
    public StringBuffer getAllSensorRecord() throws IOException {
        Dbutil dbutil = new Dbutil();
        SqlSession sqlSession = dbutil.getSqlsession();
        AreaMapper areaMapper = sqlSession.getMapper(AreaMapper.class);
        List<AreaEntity> list = areaMapper.getAllAreaInfo();
        sqlSession.commit();
        sqlSession.close();
        StringBuffer stringBuffer = new StringBuffer();
        Iterator<AreaEntity> iterator= list.iterator();
        while (iterator.hasNext()){
            AreaEntity areaEntity = new AreaEntity();
            areaEntity = iterator.next();
            String a = areaEntity.getAreaName();
            String b = areaEntity.getNAME();
            stringBuffer.append(a).append("`").append(b).append("`").append("^");
        }
        System.out.println(stringBuffer.toString());
        return stringBuffer;
    }
}
