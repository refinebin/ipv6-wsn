package com.polaris.ipv6.dao;

import android.database.sqlite.SQLiteDatabase;

public interface SqlDao {
    String selectImaUrl(SQLiteDatabase db);

    void setImaUrl(SQLiteDatabase db,String imaUrl);
}
