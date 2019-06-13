package com.polaris.ipv6.model.impl;

import android.util.Log;

import com.polaris.ipv6.entity.AreaEntity;
import com.polaris.ipv6.entity.SensorRecordEntity;
import com.polaris.ipv6.model.AreaModel;
import com.polaris.ipv6.presenter.AreaPresenter;
import com.polaris.ipv6.util.IpAddress;
import com.zhy.http.okhttp.OkHttpUtils;
import com.zhy.http.okhttp.callback.StringCallback;

import java.util.ArrayList;
import java.util.List;

public class AreaModelImpl implements AreaModel {
    AreaPresenter areaPresenter;
    public AreaModelImpl(AreaPresenter areaPresenter){
        this.areaPresenter = areaPresenter;
    }
    public void getAllAreaInfo(){
        String url = "http://"+ IpAddress.ipAddress+"/TestIpv6App/AreaServlet";
        OkHttpUtils
                .get()
                .url(url)
                .build()
                .execute(new StringCallback()
                {
                    @Override
                    public void onError(com.squareup.okhttp.Request request, Exception e) {
                        Log.d("网络接口  ：","读取区域管理信息时出错");
                    }

                    @Override
                    public void onResponse(String response)
                    {
                        List<AreaEntity> list = new ArrayList<AreaEntity>();
                        String noteArray[] = response.split("\\^");
                        for (String a:noteArray){
                            AreaEntity areaEntity = new AreaEntity();
                            String entityArray[] = a.split("`");
                            areaEntity.setAreaName(entityArray[0]);
                            areaEntity.setNAME(entityArray[1]);
                            list.add(areaEntity);
                        }

                        areaPresenter.setListView(list);
                    }

                });

    }
}
