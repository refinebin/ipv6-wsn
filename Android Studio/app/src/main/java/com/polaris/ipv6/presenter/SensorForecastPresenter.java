package com.polaris.ipv6.presenter;

import com.polaris.ipv6.entity.SensorForecastEntity;
import com.polaris.ipv6.model.SensorForecastModel;
import com.polaris.ipv6.model.impl.SensorForecastModelImpl;
import com.polaris.ipv6.view.SensorForecastView;

import java.util.List;

public class SensorForecastPresenter {
    SensorForecastModel sensorForecastModel;
    SensorForecastView sensorForecastView;
    public SensorForecastPresenter(SensorForecastView sensorForecastView){
        sensorForecastModel = new SensorForecastModelImpl(this);
        this.sensorForecastView = sensorForecastView;
    }

    public void getListView(){
        sensorForecastModel.getAllForecastResult();
    }

    public void setListView(List<SensorForecastEntity> list){
        sensorForecastView.setListView(list);
    }

}
