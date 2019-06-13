package com.polaris.ipv6.model.impl;

import android.database.sqlite.SQLiteDatabase;

import com.polaris.ipv6.dao.SqlDao;
import com.polaris.ipv6.dao.daoImpl.SqlDaoImpl;
import com.polaris.ipv6.model.EscapeRoutesModel;
import com.polaris.ipv6.presenter.EscapeRoutesPresenter;

public class EscapeRoutesModelImpl implements EscapeRoutesModel{
    SqlDao sqlDao;
    EscapeRoutesPresenter escapeRoutesPresenter;
    public EscapeRoutesModelImpl(EscapeRoutesPresenter escapeRoutesPresenter){
        this.escapeRoutesPresenter = escapeRoutesPresenter;
        sqlDao = new SqlDaoImpl();
    }
    @Override
    public String getImaUrl(SQLiteDatabase db) {
       String imaUrl =  sqlDao.selectImaUrl(db);
        return imaUrl;
    }

    @Override
    public void replaceImaUrl(SQLiteDatabase db, String imaUrl) {
        sqlDao.setImaUrl(db, imaUrl);
    }

}
