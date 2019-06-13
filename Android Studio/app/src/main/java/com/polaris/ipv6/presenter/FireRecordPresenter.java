package com.polaris.ipv6.presenter;

import com.polaris.ipv6.entity.FireRecordEntity;
import com.polaris.ipv6.model.FireRecordModel;
import com.polaris.ipv6.model.impl.FireRecordModelImpl;
import com.polaris.ipv6.view.FireRecordView;

import java.util.List;

public class FireRecordPresenter {
    private FireRecordView fireRecordView;
    private FireRecordModel fireRecordModel;
    public FireRecordPresenter(FireRecordView fireRecordView){
        this.fireRecordView = fireRecordView;
        fireRecordModel = new FireRecordModelImpl(this);
    }
    public void getListView(){
        fireRecordModel.getAllFireRecordInfo();
    }

    public void setListView(List<FireRecordEntity> list){
        fireRecordView.setListView(list);
    }
}
