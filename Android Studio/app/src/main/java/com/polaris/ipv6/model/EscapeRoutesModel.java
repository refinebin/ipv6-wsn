package com.polaris.ipv6.model;

import android.database.sqlite.SQLiteDatabase;

public interface EscapeRoutesModel {
    public String getImaUrl(SQLiteDatabase db);

    public void replaceImaUrl(SQLiteDatabase db,String imaUrl);
}
