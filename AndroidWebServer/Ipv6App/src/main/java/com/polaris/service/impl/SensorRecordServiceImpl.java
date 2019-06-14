package com.polaris.service.impl;

import com.polaris.entity.SensorForecastEntity;
import com.polaris.entity.SensorRecordEntity;
import com.polaris.mapper.SensorForecastMapper;
import com.polaris.mapper.SensorRecordMapper;
import com.polaris.service.SensorRecordService;
import com.polaris.util.Dbutil;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class SensorRecordServiceImpl implements SensorRecordService {
    public StringBuffer getAllSensorRecord(String id) throws IOException {
        Dbutil dbutil = new Dbutil();
        SqlSession sqlSession = dbutil.getSqlsession();
        SensorRecordMapper sensorRecordMapper = sqlSession.getMapper(SensorRecordMapper.class);
        List<SensorRecordEntity> list = sensorRecordMapper.getAllSensorRecord(id);
        System.out.println("id    "+id);
        sqlSession.commit();
        sqlSession.close();
        StringBuffer stringBuffer = new StringBuffer();
        Iterator<SensorRecordEntity> iterator= list.iterator();
        while (iterator.hasNext()){
            SensorRecordEntity sensorRecordEntity = new SensorRecordEntity();
            sensorRecordEntity = iterator.next();
            String a = sensorRecordEntity.getRecordValue();
            String b = sensorRecordEntity.getCreateTime();
            stringBuffer.append(a).append("`").append(b).append("`").append("^");
        }
        System.out.println(stringBuffer.toString());
        return stringBuffer;
    }
}
