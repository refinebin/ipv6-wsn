package com.room.receive.entity;

import java.sql.Timestamp;

/**
 * Created by 16:40 on 2018/3/5
 * @author wenbai
 */

public class Record {

    private int id;
    private int areaId;
    private int sensorId;
    private double recordValue;
    private Timestamp createTime;
    private Timestamp modifyTime;
    private int isDelete;

    public Record() {
        this(0);
    }

    public Record(int sensorId) {
        this(sensorId, 0);
    }

    public Record(int sensorId, double recordValue) {
        this(0, sensorId, recordValue);
    }

    public Record(int areaId, int sensorId, double recordValue) {
        this(areaId, sensorId, recordValue, null, null, 0);
    }

    public Record(int areaId, int sensorId, double recordValue, Timestamp createTime, Timestamp modifyTime, int isDelete) {
        this(0, areaId, sensorId, recordValue, createTime, modifyTime, isDelete);
    }

    public Record(int id, int areaId, int sensorId,
                  double recordValue, Timestamp createTime, Timestamp modifyTime, int isDelete) {
        setId(id);
        setAreaId(areaId);
        setSensorId(sensorId);
        setRecordValue(recordValue);
        setCreateTime(createTime);
        setModifyTime(modifyTime);
        setIsDelete(isDelete);
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAreaId() {
        return areaId;
    }

    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public int getSensorId() {
        return sensorId;
    }

    public void setSensorId(int sensorId) {
        this.sensorId = sensorId;
    }

    public double getRecordValue() {
        return recordValue;
    }

    public void setRecordValue(double recordValue) {
        this.recordValue = recordValue;
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
