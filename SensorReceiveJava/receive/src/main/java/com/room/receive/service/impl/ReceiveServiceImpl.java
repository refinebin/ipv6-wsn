package com.room.receive.service.impl;

import com.room.receive.entity.Area;
import com.room.receive.entity.Record;
import com.room.receive.entity.Sensor;
import com.room.receive.entity.Warn;
import com.room.receive.mapper.AreaMapper;
import com.room.receive.mapper.RecordMapper;
import com.room.receive.mapper.SensorMapper;
import com.room.receive.service.ReceiveService;
import com.room.receive.thread.ReceiveThread;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;


/**
 * Created by 10238 on 2018/3/13.
 * @author liangjh
 */
@Service("receiveService")
public class ReceiveServiceImpl implements ReceiveService{

    Logger logger = LoggerFactory.getLogger(ReceiveServiceImpl.class);

    @Autowired
    private SensorMapper sensorMapper;

    @Autowired
    private RecordMapper recordMapper;

    @Autowired
    private AreaMapper areaMapper;


    private void insertRecord(Sensor sensor,Double data){
        Record record = new Record();
        record.setAreaId(sensor.getAreaId());
        record.setCreateTime(new Timestamp(System.currentTimeMillis()));
        record.setModifyTime(new Timestamp(System.currentTimeMillis()));
        record.setIsDelete(0);
        record.setSensorId(sensor.getSensorId());
        record.setRecordValue(data);
        recordMapper.insertRecord(record);
    }

    private void insertWarn(Sensor sensor,Double data){
        Warn warn = new Warn();
        warn.setIsDelete(0);
        warn.setCreateTime(new Timestamp(System.currentTimeMillis()));
        warn.setModifyTime(new Timestamp(System.currentTimeMillis()));
        warn.setSend(0);
        warn.setSensorId(sensor.getSensorId());
        warn.setSensorName(sensor.getSensorName());
        warn.setThresholdValue(sensor.getThresholdValue());
        warn.setValue(data);
        Area area = new Area();
        area.setAreaId(sensor.getAreaId());
        area = areaMapper.selectOne(area);
        warn.setAreaName(area.getAreaName());
        warn.setAreaId(area.getAreaId());

    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void receiveSensorData(String sensorNumber, String sensorValue) {
        logger.debug("receiveSensorData");
        //检测设备是否存在
        Sensor sensor = new Sensor();
        sensor.setSensorId(Integer.parseInt(sensorNumber));
        sensor = sensorMapper.selectBySensorId(sensor.getSensorId());

        //存在检测设备数据知否超标
        if(sensor != null){
            logger.debug("insert");
            logger.debug("Value:"+sensorValue);
            logger.debug("Value:"+Double.parseDouble(sensorValue));
            if(sensor.getThresholdValue() > Double.parseDouble(sensorValue)){
                //未超标记录数据
                insertRecord(sensor,Double.parseDouble(sensorValue));
            }else{
                //超标记录警告保存数据

                insertRecord(sensor,Double.parseDouble(sensorValue));
            }



        }else{
            logger.error("该传感器不存在"+Integer.valueOf(sensorNumber));
            return ;
        }


    }
}
