package com.polaris.ipv6.view.viewAdapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.FireRecordEntity;

import java.util.List;

public class FireRecordAdapter extends BaseAdapter{
    Context context;
    LayoutInflater layoutInflater;
    List<FireRecordEntity> list;
    public FireRecordAdapter(Context context,List<FireRecordEntity> list){
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
        if(view==null){
            viewHolder = new ViewHolder();
            view = layoutInflater.inflate(R.layout.fire_record_adapter,null);
            viewHolder.fire_kind_value = view.findViewById(R.id.fire_kind_value);
            viewHolder.fire_time_value = view.findViewById(R.id.fire_time_value);
            viewHolder.fire_area_value = view.findViewById(R.id.fire_area_value);
            view.setTag(viewHolder);
        }else{
            viewHolder = (ViewHolder) view.getTag();
        }
        viewHolder.fire_kind_value.setText(list.get(i).getKindName());
        viewHolder.fire_time_value.setText(list.get(i).getCreateTime());
        viewHolder.fire_area_value.setText(list.get(i).getAreaName());

        return view;
    }
    private class ViewHolder{
        private TextView fire_kind_value;
        private TextView fire_time_value;
        private TextView fire_area_value;
    }
}
