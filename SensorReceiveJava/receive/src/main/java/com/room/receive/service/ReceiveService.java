package com.room.receive.service;

/**
 * Created by 10238 on 2018/3/13.
 * @author liangjh
 */
public interface ReceiveService {

    /**
     * 保存传感器数据
     * @param sensorNumber 传感器编号
     * @param sensorValue 传感器值
     */
    public void receiveSensorData(String sensorNumber ,String sensorValue);

}
