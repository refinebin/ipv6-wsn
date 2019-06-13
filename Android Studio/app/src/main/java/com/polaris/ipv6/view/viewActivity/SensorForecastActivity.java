package com.polaris.ipv6.view.viewActivity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ListView;

import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.SensorForecastEntity;
import com.polaris.ipv6.entity.SensorRecordEntity;
import com.polaris.ipv6.presenter.SensorForecastPresenter;
import com.polaris.ipv6.view.SensorForecastView;
import com.polaris.ipv6.view.viewActivity.chart.HumidityChartActivity;
import com.polaris.ipv6.view.viewActivity.chart.SensorForecastChartActivity;
import com.polaris.ipv6.view.viewActivity.sensor.HumidityActivity;
import com.polaris.ipv6.view.viewAdapter.SensorForercastAdapter;

import java.io.Serializable;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class SensorForecastActivity extends AppCompatActivity implements SensorForecastView {
    @BindView(R.id.sensor_forecast_listView)
    ListView listView;
    @BindView(R.id.sensor_forecast_chart_btn)
    Button chartBtn;
    List<SensorForecastEntity> list;
    SensorForecastPresenter sensorForecastPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sensor_forecast);
        ButterKnife.bind(this);
        chartBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                if (list == null){
//                    return;
//                }
//                Intent intent = new Intent(SensorForecastActivity.this, SensorForecastChartActivity.class);
//                intent.putExtra("SensorForecastList", (Serializable) list);
//                startActivity(intent);
            }
        });
        sensorForecastPresenter = new SensorForecastPresenter(this);
        getForecastValue();
    }


    @Override
    public void setListView(List<SensorForecastEntity> list) {
        this.list = list;
        listView.setAdapter(new SensorForercastAdapter(this,list));
        if (list == null){
            return;
        }
        Intent intent = new Intent(SensorForecastActivity.this, SensorForecastChartActivity.class);
        intent.putExtra("SensorForecastList", (Serializable) list);
        startActivity(intent);
        finish();
    }

    @Override
    public void getForecastValue() {
        sensorForecastPresenter.getListView();
    }
}
