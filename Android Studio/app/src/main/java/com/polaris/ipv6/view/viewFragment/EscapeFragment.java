package com.polaris.ipv6.view.viewFragment;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

import com.polaris.ipv6.R;
import com.polaris.ipv6.view.viewActivity.EscapeRoutesActivity;
import com.polaris.ipv6.view.viewActivity.MainActivity;

public class EscapeFragment extends Fragment {
    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.frag_escape, container, false);
        Button escapeBtn = view.findViewById(R.id.escape_routes_btn);
        escapeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(view.getContext(), EscapeRoutesActivity.class);
                startActivity(intent);
            }
        });
        return view;
    }
}
