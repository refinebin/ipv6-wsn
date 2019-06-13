package com.polaris.ipv6.view;

import com.polaris.ipv6.entity.SensorRecordEntity;

import java.util.List;

public interface SensorView {
    public void setListView(List<SensorRecordEntity> list);

    public void getRecordValue();
}
