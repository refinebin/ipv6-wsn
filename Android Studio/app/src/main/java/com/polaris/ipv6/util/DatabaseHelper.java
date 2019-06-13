package com.polaris.ipv6.util;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import android.widget.Toast;

/**
 * @author winkyle
 */

public class DatabaseHelper extends SQLiteOpenHelper {
    public static final String CREATE_MEMO = "create table fire_route ("
            + "id integer primary key, "
            + "imaUrl text,"
            + "createTime text,"
            + "modifyTime text)";

    private Context mContext;
    public DatabaseHelper(Context context, String name, CursorFactory
            factory, int version) {
        super(context, name, factory, version);
        mContext = context;
    }
    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_MEMO);
        Log.d("创建数据库： ","create ok");
        Toast.makeText(mContext, "Create succeeded", Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("drop table if exists note");
        onCreate(db);
    }
}

