package com.polaris.ipv6.entity;

public class Sensor {
    private String sensor_name;
    private String threshold_value;
    private String modify_time;
    private String create_time;
    public String getSensor_name() {
        return sensor_name;
    }

    public void setSensor_name(String sensor_name) {
        this.sensor_name = sensor_name;
    }

    public String getThreshold_value() {
        return threshold_value;
    }

    public void setThreshold_value(String threshold_value) {
        this.threshold_value = threshold_value;
    }

    public String getModify_time() {
        return modify_time;
    }

    public void setModify_time(String modify_time) {
        this.modify_time = modify_time;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

}
