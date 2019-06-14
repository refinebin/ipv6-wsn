package com.polaris.mapper;

import com.polaris.entity.SensorRecordEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SensorRecordMapper {
    public List<SensorRecordEntity> getAllSensorRecord(@Param("sensorId") String sensorId);
}
