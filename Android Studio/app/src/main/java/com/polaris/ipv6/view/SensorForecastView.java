package com.polaris.ipv6.view;


import com.polaris.ipv6.entity.SensorForecastEntity;

import java.util.List;

public interface SensorForecastView {
    public void setListView(List<SensorForecastEntity> list);

    public void getForecastValue();
}
