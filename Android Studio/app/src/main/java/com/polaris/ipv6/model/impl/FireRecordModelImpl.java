package com.polaris.ipv6.model.impl;

import android.util.Log;

import com.polaris.ipv6.entity.AreaEntity;
import com.polaris.ipv6.entity.FireRecordEntity;
import com.polaris.ipv6.model.FireRecordModel;
import com.polaris.ipv6.presenter.FireRecordPresenter;
import com.polaris.ipv6.util.IpAddress;
import com.zhy.http.okhttp.OkHttpUtils;
import com.zhy.http.okhttp.callback.StringCallback;

import java.util.ArrayList;
import java.util.List;

public class FireRecordModelImpl implements FireRecordModel {
    FireRecordPresenter fireRecordPresenter;
    public FireRecordModelImpl(FireRecordPresenter fireRecordPresenter){
        this.fireRecordPresenter = fireRecordPresenter;
    }
    @Override
    public void getAllFireRecordInfo() {
        String url = "http://"+ IpAddress.ipAddress+"/TestIpv6App/FireRecordServlet";
        OkHttpUtils
                .get()
                .url(url)
                .build()
                .execute(new StringCallback()
                {
                    @Override
                    public void onError(com.squareup.okhttp.Request request, Exception e) {
                        Log.d("网络接口  ：","读取消防方案信息时出错");
                    }
                    @Override
                    public void onResponse(String response)
                    {
                        List<FireRecordEntity> list = new ArrayList<FireRecordEntity>();
                        String noteArray[] = response.split("\\^");
                        for (String a:noteArray){
                            FireRecordEntity fireRecordEntity = new FireRecordEntity();
                            String entityArray[] = a.split("`");
                            fireRecordEntity.setKindName(entityArray[0]);
                            fireRecordEntity.setCreateTime(entityArray[1]);
                            fireRecordEntity.setAreaName(entityArray[2]);

                            list.add(fireRecordEntity);
                        }

                        fireRecordPresenter.setListView(list);
                    }

                });
    }
}
