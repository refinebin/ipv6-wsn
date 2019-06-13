package com.polaris.ipv6.view.viewFragment;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.Toast;

import com.polaris.ipv6.R;
import com.polaris.ipv6.view.viewActivity.MainActivity;

public class CallFragment extends Fragment {
    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.frag_call, container, false);
        Button callBtn = view.findViewById(R.id.call_btn);
        callBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent2 = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + "10086"));
                intent2.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                if (ActivityCompat.checkSelfPermission(view.getContext(), Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                    // TODO: Consider calling
                    //    ActivityCompat#requestPermissions
                    // here to request the missing permissions, and then overriding
                    //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
                    //                                          int[] grantResults)
                    // to handle the case where the user grants the permission. See the documentation
                    // for ActivityCompat#requestPermissions for more details.
                    return;
                }
                startActivity(intent2);
                Toast.makeText(view.getContext(), "拨打电话！", Toast.LENGTH_SHORT).show();
            }
        });
        return view;
    }
}
