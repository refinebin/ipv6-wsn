package com.polaris.ipv6.view.viewAdapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.AreaEntity;

import java.util.List;

public class AreaAdapter extends BaseAdapter {
    Context context;
    LayoutInflater layoutInflater;
    List<AreaEntity> list;
    public AreaAdapter(Context context,List<AreaEntity> list){
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
        if(view == null){
            viewHolder = new ViewHolder();
            view = layoutInflater.inflate(R.layout.area_adapter,null);
            viewHolder.area_id_value = view.findViewById(R.id.area_id_value);
            viewHolder.area_admin_value = view.findViewById(R.id.area_admin_value);
            view.setTag(viewHolder);
        }else {
            viewHolder = (ViewHolder) view.getTag();
        }
        viewHolder.area_id_value.setText(list.get(i).getAreaName());
        viewHolder.area_admin_value.setText(list.get(i).getNAME());
        return view;
    }

    private class ViewHolder{
        TextView area_id_value;
        TextView area_admin_value;

    }
}
