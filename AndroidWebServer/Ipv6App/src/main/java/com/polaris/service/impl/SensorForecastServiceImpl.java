package com.polaris.service.impl;

import com.polaris.entity.SensorForecastEntity;
import com.polaris.mapper.SensorForecastMapper;
import com.polaris.service.SensorForecastService;
import com.polaris.util.Dbutil;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

public class SensorForecastServiceImpl implements SensorForecastService {


    public StringBuffer getAllForecastResult() throws IOException {
        Dbutil dbutil = new Dbutil();
        SqlSession sqlSession = dbutil.getSqlsession();
        SensorForecastMapper sensorForecastMapper = sqlSession.getMapper(SensorForecastMapper.class);
        List<SensorForecastEntity> list = sensorForecastMapper.getAllForecastResult();
        sqlSession.commit();
        sqlSession.close();
        StringBuffer stringBuffer = new StringBuffer();
        Iterator<SensorForecastEntity> iterator= list.iterator();
        while (iterator.hasNext()){
            SensorForecastEntity sensorForecastEntity = new SensorForecastEntity();
            sensorForecastEntity = iterator.next();
            String a = sensorForecastEntity.getTemperatureValue();
            String b = sensorForecastEntity.getHumidityValue();
            String c = sensorForecastEntity.getSmokeValue();
            String d = sensorForecastEntity.getMingResult();
            String e = sensorForecastEntity.getYinResult();
            String f = sensorForecastEntity.getWuResult();
            String g = sensorForecastEntity.getCreateTime();
            stringBuffer.append(a).append("`").append(b).append("`").append(c).append("`").append(d).append("`").append(e).append("`").append(f).append("`").append(g).append("^");
        }
        return stringBuffer;
    }
}
