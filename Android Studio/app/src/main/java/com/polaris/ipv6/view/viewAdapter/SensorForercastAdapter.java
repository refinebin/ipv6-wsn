package com.polaris.ipv6.view.viewAdapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.SensorForecastEntity;

import java.util.List;

public class SensorForercastAdapter extends BaseAdapter{
    Context context;
    LayoutInflater layoutInflater;
    List<SensorForecastEntity> list;
    public SensorForercastAdapter(Context context, List<SensorForecastEntity> list){
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
        if (view == null){
            viewHolder = new ViewHolder();
            view = layoutInflater.inflate(R.layout.sensor_forcast_adapter,null);
            viewHolder.forecast_temperature_value = view.findViewById(R.id.forecast_temperature_value);
            viewHolder.forecast_humidity_value = view.findViewById(R.id.forecast_humidity_value);
            viewHolder.forecast_smoke_value = view.findViewById(R.id.forecast_smoke_value);
            viewHolder.forecast_ming_value = view.findViewById(R.id.forecast_ming_value);
            viewHolder.forecast_yin_value = view.findViewById(R.id.forecast_yin_value);
            viewHolder.forecast_wu_value = view.findViewById(R.id.forecast_wu_value);
            viewHolder.sensor_forecast_time_value = view.findViewById(R.id.sensor_forecast_time_value);
            view.setTag(viewHolder);
        }else{
            viewHolder = (ViewHolder) view.getTag();
        }
        viewHolder.forecast_temperature_value.setText(list.get(i).getTemperature_value());
        viewHolder.forecast_humidity_value.setText(list.get(i).getHumidity_value());
        viewHolder.forecast_smoke_value.setText(list.get(i).getSmoke_value());
        viewHolder.forecast_ming_value.setText(list.get(i).getMing_result());
        viewHolder.forecast_yin_value.setText(list.get(i).getYin_result());
        viewHolder.forecast_wu_value.setText(list.get(i).getWu_result());
        viewHolder.sensor_forecast_time_value.setText(list.get(i).getCreate_time());

        return view;
    }

    private class ViewHolder{
        private TextView forecast_temperature_value;
        private TextView forecast_humidity_value;
        private TextView forecast_smoke_value;
        private TextView forecast_ming_value;
        private TextView forecast_yin_value;
        private TextView forecast_wu_value;
        private TextView sensor_forecast_time_value;
    }

}
