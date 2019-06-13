package com.polaris.ipv6.model.impl;

import android.util.Log;

import com.polaris.ipv6.entity.SensorForecastEntity;
import com.polaris.ipv6.entity.SensorRecordEntity;
import com.polaris.ipv6.model.SensorRecordModel;
import com.polaris.ipv6.presenter.SensorRecordPresenter;
import com.polaris.ipv6.util.IpAddress;
import com.zhy.http.okhttp.OkHttpUtils;
import com.zhy.http.okhttp.callback.StringCallback;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SensorRecordModelImpl implements SensorRecordModel {
    SensorRecordPresenter sensorRecordPresenter;
    public SensorRecordModelImpl(SensorRecordPresenter sensorRecordPresenter){
        this.sensorRecordPresenter = sensorRecordPresenter;
    }
    @Override
    public void getAllSensorRecord(int sensorId) {
        String url = "http://"+ IpAddress.ipAddress+"/TestIpv6App/SensorRecordServlet";
        OkHttpUtils
                .get()
                .url(url)
                .addParams("sensorId",String.valueOf(sensorId))
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
                        List<SensorRecordEntity> list = new ArrayList<SensorRecordEntity>();
                        String noteArray[] = response.split("\\^");
                        for (String a:noteArray){
                            SensorRecordEntity sensorRecordEntity = new SensorRecordEntity();
                            String entityArray[] = a.split("`");
                            sensorRecordEntity.setRecord_value(entityArray[0]);
                            sensorRecordEntity.setCreate_time(entityArray[1]);
                            list.add(sensorRecordEntity);
                        }

                        sensorRecordPresenter.setListView(list);
                    }

                });
    }
}
