package com.polaris.ipv6.presenter;

import android.database.sqlite.SQLiteDatabase;

import com.polaris.ipv6.model.EscapeRoutesModel;
import com.polaris.ipv6.model.impl.EscapeRoutesModelImpl;
import com.polaris.ipv6.view.EscapeRoutesView;

public class EscapeRoutesPresenter {
    private EscapeRoutesModel escapeRoutesModel;
    private EscapeRoutesView escapeRoutesView;
    public EscapeRoutesPresenter(EscapeRoutesView escapeRoutesView){
        this.escapeRoutesView = escapeRoutesView;
        escapeRoutesModel = new EscapeRoutesModelImpl(this);
    }
    public String getImaUrl(SQLiteDatabase db){
        String im = escapeRoutesModel.getImaUrl(db);
        return im;
    }
    public void setImaUrl(SQLiteDatabase db,String imaUrl){
        escapeRoutesModel.replaceImaUrl(db, imaUrl);
    }

}
