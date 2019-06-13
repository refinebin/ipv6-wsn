package com.polaris.ipv6.view;

import android.database.sqlite.SQLiteDatabase;

public interface EscapeRoutesView {
    public String getImaView(SQLiteDatabase db);

    public void setImaView(SQLiteDatabase db,String imaUrl);
}
