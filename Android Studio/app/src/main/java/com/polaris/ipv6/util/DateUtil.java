package com.polaris.ipv6.util;

import java.text.SimpleDateFormat;

public class DateUtil {
    public static String formatDate(String str) {
        SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat sf2 = new SimpleDateFormat("HH:mm");
        String formatStr = "";
        try {
            formatStr = sf2.format(sf1.parse(str));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return formatStr;
    }
}
