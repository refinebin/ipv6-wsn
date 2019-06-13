package com.polaris.ipv6.view.viewActivity.chart;

import android.content.Intent;
import android.graphics.Color;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import com.github.mikephil.charting.charts.LineChart;
import com.github.mikephil.charting.components.AxisBase;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.data.LineData;
import com.github.mikephil.charting.data.LineDataSet;
import com.github.mikephil.charting.formatter.IAxisValueFormatter;
import com.polaris.ipv6.R;
import com.polaris.ipv6.entity.SensorForecastEntity;
import com.polaris.ipv6.entity.SensorRecordEntity;
import com.polaris.ipv6.util.DateUtil;
import com.polaris.ipv6.util.LineChartMarkView;
import com.polaris.ipv6.util.MyLineChart;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class SensorForecastChartActivity extends AppCompatActivity {

    List<SensorForecastEntity> list;
    @BindView(R.id.SensorForecastChart)
    LineChart lineChart;
    MyLineChart myLineChart;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sensor_forecast_chart);
        Intent intent = getIntent();
        list = (List<SensorForecastEntity>) intent.getSerializableExtra("SensorForecastList");
        ButterKnife.bind(this);
        myLineChart = new MyLineChart();
        myLineChart.initChart(lineChart);
        showLineChart(list, "明火概率", Color.CYAN);
        addLine(list,"阴燃火概率",Color.YELLOW);
        addLine2(list,"无火概率",Color.GREEN);
        LineChartMarkView mv = new LineChartMarkView(this, myLineChart.xAxis.getValueFormatter());
        mv.setChartView(lineChart);
        lineChart.setMarker(mv);
        lineChart.invalidate();
    }
    /**
     * 展示曲线
     *
     * @param dataList 数据集合
     * @param name     曲线名称
     * @param color    曲线颜色
     */
    public void showLineChart(final List<SensorForecastEntity> dataList, String name, int color) {
        List<Entry> entries = new ArrayList<>();
        for (int i = 0; i < dataList.size(); i++) {
            SensorForecastEntity data = dataList.get(i);
            String temp = removeCharAt(data.getMing_result(),0);
            temp = removeCharAt(temp,temp.length()-1);
            Entry entry = new Entry(i, Float.valueOf(temp));
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
    /**
     * 添加曲线
     */
    public void addLine(List<SensorForecastEntity> dataList, String name, int color) {
        List<Entry> entries = new ArrayList<>();
        for (int i = 0; i < dataList.size(); i++) {
            SensorForecastEntity data = dataList.get(i);
            String temp = removeCharAt(data.getYin_result(),0);
            temp = removeCharAt(temp,temp.length()-1);
            Entry entry = new Entry(i, Float.valueOf(temp));
            entries.add(entry);
        }
        // 每一个LineDataSet代表一条线
        LineDataSet lineDataSet = new LineDataSet(entries, name);
        myLineChart.initLineDataSet(lineDataSet, color, LineDataSet.Mode.LINEAR);
        lineChart.getLineData().addDataSet(lineDataSet);
        lineChart.invalidate();
    }
    public void addLine2(List<SensorForecastEntity> dataList, String name, int color) {
        List<Entry> entries = new ArrayList<>();
        for (int i = 0; i < dataList.size(); i++) {
            SensorForecastEntity data = dataList.get(i);
            String temp = removeCharAt(data.getWu_result(),0);
            temp = removeCharAt(temp,temp.length()-1);
            Entry entry = new Entry(i, Float.valueOf(temp));
            entries.add(entry);
        }
        // 每一个LineDataSet代表一条线
        LineDataSet lineDataSet = new LineDataSet(entries, name);
        myLineChart.initLineDataSet(lineDataSet, color, LineDataSet.Mode.LINEAR);
        lineChart.getLineData().addDataSet(lineDataSet);
        lineChart.invalidate();
    }
    public static String removeCharAt(String s, int pos) {
        return s.substring(0, pos) + s.substring(pos + 1);
    }
}
