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
import com.polaris.ipv6.view.viewActivity.SensorActivity;


public class SensorFragment extends Fragment {
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.frag_sensor, container, false);
        Button sensorBtn = view.findViewById(R.id.sensor_btn);
        sensorBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(view.getContext(), SensorActivity.class);
                startActivity(intent);
            }
        });
        return view;
    }
}
