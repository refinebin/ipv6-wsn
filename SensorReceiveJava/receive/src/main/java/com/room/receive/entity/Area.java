
package com.room.receive.entity;

import java.sql.Timestamp;

/**
 * Created by 16:23 on 2018/3/5
 * @author wenbai
 */
public class Area {
    private int areaId;
    private String areaName;
    private Timestamp createTime;
    private Timestamp modifyTime;
    private int isDelete;

    public Area() {
        this(0);
    }

    public Area(String areaName) {
        this(0, areaName, null, null, 0);
    }

    public Area(int areaId) {
        this(areaId, null, null, null, 0);
    }

    public Area(int areaId, Timestamp createTime, Timestamp modifyTime, int isDelete) {
        this(areaId, null, createTime, modifyTime, isDelete);
    }

    public Area(String areaName, Timestamp createTime, Timestamp modifyTime, int isDelete) {
        this(0, areaName, createTime, modifyTime, isDelete);
    }

    public Area(int areaId, String areaName, Timestamp createTime, Timestamp modifyTime, int isDelete) {
        setAreaId(areaId);
        setAreaName(areaName);
        setCreateTime(createTime);
        setModifyTime(modifyTime);
        setIsDelete(isDelete);
    }




    public void setAreaId(int areaId) {
        this.areaId = areaId;
    }

    public int getAreaId() {
        return this.areaId;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaName() {
        return this.areaName;
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