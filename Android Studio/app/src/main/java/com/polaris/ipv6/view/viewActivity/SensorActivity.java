package com.polaris.ipv6.view.viewActivity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.polaris.ipv6.R;
import com.polaris.ipv6.view.SensorView;
import com.polaris.ipv6.view.viewActivity.sensor.HumidityActivity;
import com.polaris.ipv6.view.viewActivity.sensor.SmokeActivity;
import com.polaris.ipv6.view.viewActivity.sensor.TemperatureActivity;

import butterknife.BindView;
import butterknife.ButterKnife;

public class SensorActivity extends AppCompatActivity{
    @BindView(R.id.temperature)
    Button temperatureBtn;
    @BindView(R.id.humidity)
    Button humidityBtn;
    @BindView(R.id.smoke)
    Button smokeBtn;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sensor);

        ButterKnife.bind(this);
        temperatureBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(SensorActivity.this, TemperatureActivity.class);
                startActivity(intent);
            }
        });
        humidityBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(SensorActivity.this, HumidityActivity.class);
                startActivity(intent);
            }
        });
        smokeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(SensorActivity.this, SmokeActivity.class);
                startActivity(intent);
            }
        });
    }
}
