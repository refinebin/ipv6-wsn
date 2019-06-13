package com.polaris.ipv6.presenter;

import com.polaris.ipv6.entity.AreaEntity;
import com.polaris.ipv6.entity.SensorForecastEntity;
import com.polaris.ipv6.model.AreaModel;
import com.polaris.ipv6.model.impl.AreaModelImpl;
import com.polaris.ipv6.view.AreaView;

import java.util.List;

public class AreaPresenter {
    private AreaView areaView;
    private AreaModel areaModel;
    public AreaPresenter(AreaView areaView){
        this.areaView = areaView;
        areaModel = new AreaModelImpl(this);
    }
    public void getListView(){
        areaModel.getAllAreaInfo();
    }

    public void setListView(List<AreaEntity> list){
        areaView.setListView(list);
    }
}
