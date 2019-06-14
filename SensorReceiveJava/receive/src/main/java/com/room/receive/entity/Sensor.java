package com.room.receive.entity;

import java.sql.Timestamp;

/**
 * Created by 16:35 on 2018/3/5
 * @author wenbai
 */
public class Sensor {

    private int sensorId;
    private int areaId;
    private String sensorName;
    private double thresholdValue;
    private Timestamp createTime;
    private Timestamp modifyTime;
    private int isDelete;

    public Sensor() {
        this(0);
    }

    public Sensor(int sensorId) {
        this(sensorId, 0, null, null, 0);
    }

    public Sensor(String sensorName, Timestamp createTime, Timestamp modifyTime, int isDelete) {
        this(0, 0, sensorName, 0, createTime, modifyTime, isDelete);
    }

    public Sensor(int sensorId, int areaId, Timestamp createTime, Timestamp modifyTime, int isDelete) {
        this(sensorId, areaId, null, 0, createTime, modifyTime, isDelete);
    }

    public Sensor(int sensorId, int areaId, String sensorName, double thresholdValue, Timestamp createTime, Timestamp modifyTime, int isDelete) {
        setSensorId(sensorId);
        setAreaId(areaId);
        setSensorName(sensorName);
        setThresholdValue(thresholdValue);
        setCreateTime(createTime);
        setModifyTime(modifyTime);
        setIsDelete(isDelete);
    }

    public int getSensorId() {
        return sensorId;
    }

    public void setSensorId(int sensorId) {
        this.sensorId = sensorId;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public String getSensorName() {
        return sensorName;
    }

    public void setSensorName(String sensorName) {
        this.sensorName = sensorName;
    }

    public double getThresholdValue() {
        return thresholdValue;
    }

    public void setThresholdValue(double thresholdValue) {
        this.thresholdValue = thresholdValue;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Timestamp modifyTime) {
        this.modifyTime = modifyTime;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }
}
