package com.polaris.ipv6.util;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

public class ClickRunning extends View{

    /**
     * 点击水波纹涟漪动画效果
     *
     * @author LGL
     *
     */
        // 画笔
        private Paint mPaint;
        // 内圆宽度
        private int strokeWidth;
        // 圆心x
        private int cx;
        // 圆心y
        private int cy;
        // 半径
        private int radius;
        // Handler消息
        private static final int FLUSH = 0;

        public ClickRunning(Context context, AttributeSet attrs) {
            super(context, attrs);

            init();

        }

        private void init() {

            // 初始化画笔
            mPaint = new Paint();
            // 抗锯齿
            mPaint.setAntiAlias(true);
            // 设置颜色
            mPaint.setColor(Color.rgb(0,245,255));
            // 设置空心
            mPaint.setStyle(Style.STROKE);
            // 设置内圆的宽度
            mPaint.setStrokeWidth(strokeWidth);
            // 设置透明度 0-255
            mPaint.setAlpha(255);

            // 初始值
            strokeWidth = 0;
            radius = 0;
        }

        /**
         * 绘制
         */
        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            // 绘制圆环
            canvas.drawCircle(cx, cy, radius, mPaint);
        }

        /**
         * 触摸事件
         */
        @Override
        public boolean onTouchEvent(MotionEvent event) {

            // 判断手势按下和抬起
            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    /**
                     * 按下去开始画圆，也就是起涟漪，所以我们首先得获取到按下的坐标，事实上，我们要做这样操作的开发，都必须先提前拿到该有的坐标
                     */
                    cx = (int) event.getX();
                    cy = (int) event.getY();
                    Log.i("坐标", "圆心x：" + cx + "圆心y:" + cy);

                    break;
            }
            // 初始化
            init();
            // 发送
            handler.sendEmptyMessage(FLUSH);
            return true;
        }

        /**
         * 刷新状态
         */
        private void flush() {
            // 半径每次+10
            radius += 10;
            // 线条的宽度每次都是半径的四分之一
            strokeWidth = radius / 4;
            // 重新设置给画笔
            mPaint.setStrokeWidth(strokeWidth);
            // 颜色渐变,每次减少20的色值
            int nextAlpha = mPaint.getAlpha() - 40;
            // 避免等于负数
            if (nextAlpha < 20) {
                // 直接设置为透明
                nextAlpha = 0;
            }
            // 继续重新设置给画笔
            mPaint.setAlpha(nextAlpha);
        }

        @SuppressLint("HandlerLeak")
        private Handler handler = new Handler() {
            public void handleMessage(android.os.Message msg) {
                switch (msg.what) {
                    case FLUSH:
                        // 更改参数状态
                        flush();
                        // 刷新 执行我们的绘制方法
                        invalidate();
                        // 继续验证透明度,只要不为0就一直发送，直到透明
                        if (mPaint.getAlpha() != 0) {
                            handler.sendEmptyMessageDelayed(FLUSH, 100);
                        }
                        break;
                }
            }
        };
    }
