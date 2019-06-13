package com.polaris.ipv6.presenter;

import com.polaris.ipv6.entity.SensorRecordEntity;
import com.polaris.ipv6.model.SensorRecordModel;
import com.polaris.ipv6.model.impl.SensorRecordModelImpl;
import com.polaris.ipv6.view.SensorView;

import java.util.List;

public class SensorRecordPresenter {
    SensorRecordModel sensorRecordModel;
    SensorView sensorView;
    public SensorRecordPresenter(SensorView sensorView){
        this.sensorView = sensorView;
        sensorRecordModel = new SensorRecordModelImpl(this);
    }

    public void getListView(int id){
        sensorRecordModel.getAllSensorRecord(id);
    }

    public void setListView(List<SensorRecordEntity> list){
        sensorView.setListView(list);
    }
}
