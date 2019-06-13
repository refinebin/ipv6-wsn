package com.polaris.ipv6.entity;

import java.io.Serializable;

public class SensorForecastEntity implements Serializable {
    private String temperature_value;
    private String humidity_value;
    private String smoke_value;
    private String ming_result;
    private String yin_result;
    private String wu_result;
    private String create_time;
    public String getTemperature_value() {
        return temperature_value;
    }

    public void setTemperature_value(String temperature_value) {
        this.temperature_value = temperature_value;
    }

    public String getHumidity_value() {
        return humidity_value;
    }

    public void setHumidity_value(String humidity_value) {
        this.humidity_value = humidity_value;
    }

    public String getSmoke_value() {
        return smoke_value;
    }

    public void setSmoke_value(String smoke_value) {
        this.smoke_value = smoke_value;
    }

    public String getMing_result() {
        return ming_result;
    }

    public void setMing_result(String ming_result) {
        this.ming_result = ming_result;
    }

    public String getYin_result() {
        return yin_result;
    }

    public void setYin_result(String yin_result) {
        this.yin_result = yin_result;
    }

    public String getWu_result() {
        return wu_result;
    }

    public void setWu_result(String wu_result) {
        this.wu_result = wu_result;
    }


    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

}
