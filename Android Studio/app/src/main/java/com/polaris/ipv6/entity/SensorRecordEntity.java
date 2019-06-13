package com.polaris.ipv6.entity;

import java.io.Serializable;

public class SensorRecordEntity implements Serializable {
    private String record_value;
    private String create_time;
    private String modify_time;
    public String getRecord_value() {
        return record_value;
    }

    public void setRecord_value(String record_value) {
        this.record_value = record_value;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getModify_time() {
        return modify_time;
    }

    public void setModify_time(String modify_time) {
        this.modify_time = modify_time;
    }

}
