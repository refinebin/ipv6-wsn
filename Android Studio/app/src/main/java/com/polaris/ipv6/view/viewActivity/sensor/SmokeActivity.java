package com.polaris.ipv6.view.viewActivity.sensor;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;

import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.SensorRecordEntity;
import com.polaris.ipv6.presenter.SensorRecordPresenter;
import com.polaris.ipv6.view.SensorView;
import com.polaris.ipv6.view.viewActivity.chart.SmokeChartActivity;
import com.polaris.ipv6.view.viewActivity.chart.TemperatureChartActivity;
import com.polaris.ipv6.view.viewAdapter.SmokeAdapter;
import com.polaris.ipv6.view.viewAdapter.TemperatureAdapter;

import java.io.Serializable;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class SmokeActivity extends AppCompatActivity implements SensorView {
    @BindView(R.id.smoke_listView)
    ListView listView;
    @BindView(R.id.smoke_chart_btn)
    Button chartBtn;
    List<SensorRecordEntity> list;
    SensorRecordPresenter sensorRecordPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_smoke);
        ButterKnife.bind(this);
        chartBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                if (list == null){
//                    return;
//                }
//                Intent intent = new Intent(SmokeActivity.this, SmokeChartActivity.class);
//                intent.putExtra("SmokeList", (Serializable) list);
//                startActivity(intent);
            }
        });
        sensorRecordPresenter = new SensorRecordPresenter(this);
        getRecordValue();
    }

    @Override
    public void setListView(List<SensorRecordEntity> list) {
        this.list = list;
        listView.setAdapter(new SmokeAdapter(this,list));
        if (list == null){
            return;
        }
        Intent intent = new Intent(SmokeActivity.this, SmokeChartActivity.class);
        intent.putExtra("SmokeList", (Serializable) list);
        startActivity(intent);
        finish();
    }

    @Override
    public void getRecordValue() {
        sensorRecordPresenter.getListView(3);
    }
}
