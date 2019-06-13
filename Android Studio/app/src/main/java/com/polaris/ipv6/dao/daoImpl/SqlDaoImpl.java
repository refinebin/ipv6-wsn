package com.polaris.ipv6.dao.daoImpl;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import com.polaris.ipv6.dao.SqlDao;

import java.util.Date;

public class SqlDaoImpl implements SqlDao {

    @Override
    public String selectImaUrl(SQLiteDatabase db) {
        Cursor cursor = db.rawQuery("select imaUrl from fire_route", null);
        String imaUrl = null;
        if (cursor.moveToFirst()) {
            do {
                imaUrl = cursor.getString(cursor.getColumnIndex("imaUrl"));
            } while (cursor.moveToNext());
        }
        cursor.close();
        return imaUrl;
    }

    @Override
    public void setImaUrl(SQLiteDatabase db, String imaUrl) {
        db.execSQL("replace into fire_route(id,imaUrl,createTime,modifyTime)values(?,?,?,?)", new String[] { "1", imaUrl, (new Date()).toString(), (new Date()).toString() });
    }
}
