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

public class SmokeAdapter extends BaseAdapter {
    Context context;
    LayoutInflater layoutInflater;
    List<SensorRecordEntity> list;
    public SmokeAdapter(Context context,List<SensorRecordEntity> list){
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
            view = layoutInflater.inflate(R.layout.smoke_adapter,null);
            viewHolder.smoke_record_value = view.findViewById(R.id.smoke_record_value);
            viewHolder.smoke_threshold_value = view.findViewById(R.id.smoke_threshold_value);
            viewHolder.smoke_time_value = view.findViewById(R.id.smoke_time_value);
            view.setTag(viewHolder);
        }else{
            viewHolder = (ViewHolder) view.getTag();
        }
        viewHolder.smoke_record_value.setText(list.get(i).getRecord_value());
        viewHolder.smoke_time_value.setText(list.get(i).getCreate_time());
        return view;
    }
    private class ViewHolder{
        private TextView smoke_record_value;
        private TextView smoke_threshold_value;
        private TextView smoke_time_value;
    }
}
