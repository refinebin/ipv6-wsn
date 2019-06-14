package com.polaris.entity;

public class SensorForecastEntity {
    private String temperatureValue;
    private String humidityValue;
    private String smokeValue;
    private String mingResult;
    private String yinResult;
    private String wuResult;
    private String createTime;

    public String getTemperatureValue() {
        return temperatureValue;
    }

    public void setTemperatureValue(String temperatureValue) {
        this.temperatureValue = temperatureValue;
    }

    public String getHumidityValue() {
        return humidityValue;
    }

    public void setHumidityValue(String humidityValue) {
        this.humidityValue = humidityValue;
    }

    public String getSmokeValue() {
        return smokeValue;
    }

    public void setSmokeValue(String smokeValue) {
        this.smokeValue = smokeValue;
    }

    public String getMingResult() {
        return mingResult;
    }

    public void setMingResult(String mingResult) {
        this.mingResult = mingResult;
    }

    public String getYinResult() {
        return yinResult;
    }

    public void setYinResult(String yinResult) {
        this.yinResult = yinResult;
    }

    public String getWuResult() {
        return wuResult;
    }

    public void setWuResult(String wuResult) {
        this.wuResult = wuResult;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

}
