package com.polaris.ipv6.view.viewActivity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;

import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.FireRecordEntity;
import com.polaris.ipv6.presenter.FireRecordPresenter;
import com.polaris.ipv6.view.FireRecordView;
import com.polaris.ipv6.view.viewAdapter.FireRecordAdapter;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class FireRecordActivity extends AppCompatActivity implements FireRecordView{
    @BindView(R.id.fire_record_list)
    ListView listView;
    FireRecordPresenter fireRecordPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_fire_record);
        ButterKnife.bind(this);
        fireRecordPresenter = new FireRecordPresenter(this);
        getAreaInfo();
    }

    @Override
    public void setListView(List<FireRecordEntity> list) {
        listView.setAdapter(new FireRecordAdapter(this,list));
    }

    @Override
    public void getAreaInfo() {
        fireRecordPresenter.getListView();
    }
}
