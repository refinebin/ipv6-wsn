package com.polaris.ipv6.view.viewActivity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.AreaEntity;
import com.polaris.ipv6.presenter.AreaPresenter;
import com.polaris.ipv6.view.AreaView;
import com.polaris.ipv6.view.viewAdapter.AreaAdapter;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class AreaActivity extends AppCompatActivity implements AreaView{
    @BindView(R.id.area_list)
    ListView listView;

    AreaPresenter areaPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_area);
        ButterKnife.bind(this);
        areaPresenter = new AreaPresenter(this);
        getAreaInfo();
    }

    @Override
    public void setListView(List<AreaEntity> list) {
        listView.setAdapter(new AreaAdapter(this,list));
    }

    @Override
    public void getAreaInfo() {
        areaPresenter.getListView();
    }
}
