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
import com.polaris.ipv6.view.viewActivity.FireRecordActivity;
import com.polaris.ipv6.view.viewActivity.MainActivity;


public class FireRecordFragment extends Fragment {
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.frag_fire_record, container, false);
        Button fireRecordBtn = view.findViewById(R.id.fire_record_btn);
        fireRecordBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(view.getContext(), FireRecordActivity.class);
                startActivity(intent);
            }
        });
        return view;
    }
}
