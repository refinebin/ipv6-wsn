package com.polaris.ipv6.view.viewActivity.chart;

import android.content.Intent;
import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.AxisBase;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.formatter.IAxisValueFormatter;
import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.SensorRecordEntity;
import com.polaris.ipv6.util.DateUtil;
import com.polaris.ipv6.util.MyLineChart;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class TemperatureChartActivity extends AppCompatActivity {

    List<SensorRecordEntity> list;
    @BindView(R.id.temperatureLineChart)
    LineChart lineChart;
    MyLineChart myLineChart;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_temperature_chart);
        Intent intent = getIntent();
        list = (List<SensorRecordEntity>) intent.getSerializableExtra("TemperatureList");
        ButterKnife.bind(this);
        myLineChart = new MyLineChart();
        myLineChart.initChart(lineChart);
        showLineChart(list, "温度", Color.CYAN);
    }
    /**
     * 展示曲线
     *
     * @param dataList 数据集合
     * @param name     曲线名称
     * @param color    曲线颜色
     */
    public void showLineChart(final List<SensorRecordEntity> dataList, String name, int color) {
        List<Entry> entries = new ArrayList<>();
        for (int i = 0; i < dataList.size(); i++) {
            SensorRecordEntity data = dataList.get(i);
            /**
             * 在此可查看 Entry构造方法，可发现 可传入数值 Entry(float x, float y)
             * 也可传入Drawable， Entry(float x, float y, Drawable icon) 可在XY轴交点 设置Drawable图像展示
             */
            Entry entry = new Entry(i, Float.valueOf(data.getRecord_value()));
            entries.add(entry);
        }
        // 每一个LineDataSet代表一条线
        LineDataSet lineDataSet = new LineDataSet(entries, name);
        myLineChart.initLineDataSet(lineDataSet, color, LineDataSet.Mode.LINEAR);
        LineData lineData = new LineData(lineDataSet);
        lineChart.setData(lineData);
        myLineChart.xAxis.setValueFormatter(new IAxisValueFormatter() {
            @Override
            public String getFormattedValue(float value, AxisBase axis) {
                String tradeDate = dataList.get((int) value % dataList.size()).getCreate_time();
                return DateUtil.formatDate(tradeDate);
            }
        });
        myLineChart.xAxis.setLabelCount(24,false);
    }
}
