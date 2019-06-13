package com.polaris.ipv6.view;

import com.polaris.ipv6.entity.AreaEntity;
import com.polaris.ipv6.entity.FireRecordEntity;

import java.util.List;

public interface FireRecordView {
    public void setListView(List<FireRecordEntity> list);

    public void getAreaInfo();
}
