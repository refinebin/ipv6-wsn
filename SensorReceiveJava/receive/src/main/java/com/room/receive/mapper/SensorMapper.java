package com.room.receive.mapper;

import com.room.receive.entity.Sensor;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

/**
 * Created by 10238 on 2018/3/9.
 * @author liangjh
 */
@Repository
public interface SensorMapper extends Mapper<Sensor> {

    public Sensor selectBySensorId(int sensorId);
}
