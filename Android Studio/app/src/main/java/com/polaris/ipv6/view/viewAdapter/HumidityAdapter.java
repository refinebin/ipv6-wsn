package com.polaris.ipv6.view.viewAdapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.SensorRecordEntity;
import com.polaris.ipv6.view.viewActivity.sensor.HumidityActivity;

import java.util.List;

public class HumidityAdapter extends BaseAdapter {
    Context context;
    LayoutInflater layoutInflater;
    List<SensorRecordEntity> list;
    public HumidityAdapter(Context context,List<SensorRecordEntity> list){
        this.context = context;
        layoutInflater = LayoutInflater.from(context);
        this.list = list;
    }
    @Override
    public int getCount() {
        return list.size();
    }

    @Override
    public Object getItem(int i) {
        return null;
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder;
        if (view == null) {
            viewHolder = new ViewHolder();
            view = layoutInflater.inflate(R.layout.humidity_adapter,null);
            viewHolder.humidity_record_value = view.findViewById(R.id.humidity_record_value);
            viewHolder.humidity_threshold_value = view.findViewById(R.id.humidity_threshold_value);
            viewHolder.humidity_time_value = view.findViewById(R.id.humidity_time_value);
            view.setTag(viewHolder);
        }else{
            viewHolder = (ViewHolder) view.getTag();
        }
        viewHolder.humidity_record_value.setText(list.get(i).getRecord_value());
        viewHolder.humidity_time_value.setText(list.get(i).getCreate_time());
        return view;
    }
    private class ViewHolder{
        private TextView humidity_record_value;
        private TextView humidity_threshold_value;
        private TextView humidity_time_value;
    }
}
