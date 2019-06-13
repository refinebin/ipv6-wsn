package com.polaris.ipv6.view.viewAdapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.SensorRecordEntity;

import java.util.List;

public class TemperatureAdapter extends BaseAdapter {
    Context context;
    LayoutInflater layoutInflater;
    List<SensorRecordEntity>list;
    public TemperatureAdapter(Context context, List<SensorRecordEntity>list){
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
        ViewHolderRecord viewHolderRecord;
        if (view==null){
            viewHolderRecord = new ViewHolderRecord();
            view = layoutInflater.inflate(R.layout.temperature_adapter,null);
            viewHolderRecord.temperature_record_value = view.findViewById(R.id.temperature_record_value);
            viewHolderRecord.temperature_time_value = view.findViewById(R.id.temperature_time_value);
            view.setTag(viewHolderRecord);
        }else{
            viewHolderRecord = (ViewHolderRecord) view.getTag();
        }
        viewHolderRecord.temperature_record_value.setText(list.get(i).getRecord_value());
        viewHolderRecord.temperature_time_value.setText(list.get(i).getCreate_time());
        return view;
    }

    private class ViewHolderRecord{
        private TextView temperature_record_value;
        private TextView temperature_time_value;
    }
}
