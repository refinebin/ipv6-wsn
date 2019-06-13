package com.polaris.ipv6.view.viewFragment;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import com.polaris.ipv6.R;
import com.polaris.ipv6.view.viewActivity.MainActivity;
import com.polaris.ipv6.view.viewActivity.SensorForecastActivity;


public class ForecastFragment extends Fragment {

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.frag_forecast, container, false);
        Button forecastBtn = view.findViewById(R.id.sensor_forecast_btn);
        forecastBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(view.getContext(), SensorForecastActivity.class);
                startActivity(intent);
            }
        });
        return view;
    }
}
