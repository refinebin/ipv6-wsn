package com.polaris.ipv6.model.impl;

import android.util.Log;

import com.polaris.ipv6.entity.SensorForecastEntity;
import com.polaris.ipv6.model.SensorForecastModel;
import com.polaris.ipv6.presenter.SensorForecastPresenter;
import com.polaris.ipv6.util.IpAddress;
import com.zhy.http.okhttp.OkHttpUtils;
import com.zhy.http.okhttp.callback.StringCallback;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class SensorForecastModelImpl implements SensorForecastModel{

    SensorForecastPresenter sensorForecastPresenter;
    public SensorForecastModelImpl(SensorForecastPresenter sensorForecastPresenter){
        this.sensorForecastPresenter = sensorForecastPresenter;
    }

    @Override
    public void getAllForecastResult() {
        String url = "http://"+ IpAddress.ipAddress+"/TestIpv6App/SensorForecastServlet";
        OkHttpUtils
                .get()
                .url(url)
                .build()
                .execute(new StringCallback()
                {
                    @Override
                    public void onError(com.squareup.okhttp.Request request, Exception e) {
                        Log.d("网络接口  ：","读取预测值时出错");
                    }

                    @Override
                    public void onResponse(String response)
                    {
                        List<SensorForecastEntity> list = new ArrayList<SensorForecastEntity>();
                        String noteArray[] = response.split("\\^");
                        for (String a:noteArray){
                            SensorForecastEntity sensorForecastEntity = new SensorForecastEntity();
                            String entityArray[] = a.split("`");
                            sensorForecastEntity.setTemperature_value(entityArray[0]);
                            sensorForecastEntity.setHumidity_value(entityArray[1]);
                            sensorForecastEntity.setSmoke_value(entityArray[2]);
                            sensorForecastEntity.setMing_result(entityArray[3]);
                            sensorForecastEntity.setYin_result(entityArray[4]);
                            sensorForecastEntity.setWu_result(entityArray[5]);
                            sensorForecastEntity.setCreate_time(entityArray[6]);
                            list.add(sensorForecastEntity);
                        }
                        sensorForecastPresenter.setListView(list);
                    }

                });
    }
}
