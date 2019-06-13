package com.polaris.ipv6.view.viewActivity;

import android.content.Context;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import com.flyco.tablayout.SlidingTabLayout;
import com.flyco.tablayout.listener.OnTabSelectListener;
import com.polaris.ipv6.R;
import com.polaris.ipv6.ui.SimpleCardFragment;
import com.polaris.ipv6.util.ViewFindUtils;
import com.polaris.ipv6.view.MainView;
import com.polaris.ipv6.view.viewFragment.AreaFragment;
import com.polaris.ipv6.view.viewFragment.CallFragment;
import com.polaris.ipv6.view.viewFragment.EscapeFragment;
import com.polaris.ipv6.view.viewFragment.FireRecordFragment;
import com.polaris.ipv6.view.viewFragment.SensorFragment;
import com.polaris.ipv6.view.viewFragment.ForecastFragment;

import java.util.ArrayList;

import butterknife.ButterKnife;

public class MainActivity extends AppCompatActivity implements MainView,OnTabSelectListener {
//    @BindView(R.id.sensor_btn)
//    Button sensorBtn;
//    @BindView(R.id.sensor_forecast_btn)
//    Button forecastBtn;
//    @BindView(R.id.area_btn)
//    Button areaBtn;
//    @BindView(R.id.fire_record_btn)
//    Button fireRecordBtn;
//    @BindView(R.id.escape_routes_btn)
//    Button escapeBtn;
//    @BindView(R.id.call_btn)
//    Button callBtn;


    //声明四个Tab分别对应的Fragment
    private Fragment callFragment;
    private Fragment areaFragment;
    private Fragment sensorFragment;
    private Fragment forecastFragment;
    private Fragment fireRecordFragment;
    private Fragment escapeFragment;


    private Context mContext = this;
    private ArrayList<Fragment> mFragments = new ArrayList<>();
    private final String[] mTitles = {
            "区域管理", "传感器", "火灾预测"
            ,"消防档案", "安全路线", "决策"
    };
    private MyPagerAdapter mAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(com.polaris.ipv6.R.layout.activity_main);

        selectTab(0);//默认选中第一个Tab

        ButterKnife.bind(this);
//        sensorBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(MainActivity.this, SensorActivity.class);
//                startActivity(intent);
//            }
//        });
//        forecastBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(MainActivity.this, SensorForecastActivity.class);
//                startActivity(intent);
//            }
//        });
//        areaBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(MainActivity.this, AreaActivity.class);
//                startActivity(intent);
//            }
//        });
//        fireRecordBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(MainActivity.this, FireRecordActivity.class);
//                startActivity(intent);
//            }
//        });
//        escapeBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent = new Intent(MainActivity.this, EscapeRoutesActivity.class);
//                startActivity(intent);
//            }
//        });
//        callBtn.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Intent intent2 = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + "10086"));
//                intent2.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
//                if (ActivityCompat.checkSelfPermission(MainActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
//                    // TODO: Consider calling
//                    //    ActivityCompat#requestPermissions
//                    // here to request the missing permissions, and then overriding
//                    //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
//                    //                                          int[] grantResults)
//                    // to handle the case where the user grants the permission. See the documentation
//                    // for ActivityCompat#requestPermissions for more details.
//                    return;
//                }
//                startActivity(intent2);
//                Toast.makeText(MainActivity.this, "拨打电话！", Toast.LENGTH_SHORT).show();
//            }
//        });
        for (String title : mTitles) {
            mFragments.add(SimpleCardFragment.getInstance(title));
        }


        View decorView = getWindow().getDecorView();
        ViewPager vp = ViewFindUtils.find(decorView, R.id.vp);
        mAdapter = new MyPagerAdapter(getSupportFragmentManager());
        vp.setAdapter(mAdapter);

        SlidingTabLayout tabLayout_2 = ViewFindUtils.find(decorView, R.id.tl_2);

        tabLayout_2.setViewPager(vp);
        tabLayout_2.setOnTabSelectListener(this);

        vp.setCurrentItem(0);
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    private void selectTab(int i) {
        //获取FragmentManager对象
        FragmentManager manager = getSupportFragmentManager();
        //获取FragmentTransaction对象
        FragmentTransaction transaction = manager.beginTransaction();
        //先隐藏所有的Fragment
        hideFragments(transaction);
        switch (i) {
            //当选中点击的是微信的Tab时
            case 0:
                if (areaFragment == null) {
                    areaFragment = new AreaFragment();
                    transaction.add(R.id.id_content, areaFragment);
                } else {
                    transaction.show(areaFragment);
                }
                break;
            case 1:
                if (sensorFragment == null) {
                    sensorFragment = new SensorFragment();
                    transaction.add(R.id.id_content, sensorFragment);
                } else {
                    transaction.show(sensorFragment);
                }
                break;
            case 2:
                if (forecastFragment == null) {
                    forecastFragment = new ForecastFragment();
                    transaction.add(R.id.id_content, forecastFragment);
                } else {
                    transaction.show(forecastFragment);
                }
                break;
            case 3:
                if (fireRecordFragment == null) {
                    fireRecordFragment = new FireRecordFragment();
                    transaction.add(R.id.id_content, fireRecordFragment);
                } else {
                    transaction.show(fireRecordFragment);
                }
                break;
            case 4:
                if (escapeFragment == null) {
                    escapeFragment = new EscapeFragment();
                    transaction.add(R.id.id_content, escapeFragment);
                } else {
                    transaction.show(escapeFragment);
                }
                break;
            case 5:
                //如果微信对应的Fragment没有实例化，则进行实例化，并显示出来
                if (callFragment == null) {
                    callFragment = new CallFragment();
                    transaction.add(R.id.id_content, callFragment);
                } else {
                    //如果微信对应的Fragment已经实例化，则直接显示出来
                    transaction.show(callFragment);
                }
                break;
        }
        //不要忘记提交事务
        transaction.commit();
    }
    private void hideFragments(FragmentTransaction transaction) {
        if (callFragment != null) {
            transaction.hide(callFragment);
        }
        if (areaFragment != null) {
            transaction.hide(areaFragment);
        }
        if (sensorFragment != null) {
            transaction.hide(sensorFragment);
        }
        if (forecastFragment != null) {
            transaction.hide(forecastFragment);
        }
        if (fireRecordFragment != null) {
            transaction.hide(fireRecordFragment);
        }
        if (escapeFragment != null) {
            transaction.hide(escapeFragment);
        }
    }

    @Override
    public void onTabSelect(int position) {
        selectTab(position);
    }

    @Override
    public void onTabReselect(int position) {
        selectTab(position);
    }

    private class MyPagerAdapter extends FragmentPagerAdapter {
        public MyPagerAdapter(FragmentManager fm) {
            super(fm);
        }

        @Override
        public int getCount() {
            return mFragments.size();
        }

        @Override
        public CharSequence getPageTitle(int position) {
            return mTitles[position];
        }

        @Override
        public Fragment getItem(int position) {
            return mFragments.get(position);
        }
    }
}
