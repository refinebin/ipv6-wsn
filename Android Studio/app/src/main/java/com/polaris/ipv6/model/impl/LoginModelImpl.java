package com.polaris.ipv6.model.impl;

import android.util.Log;

import com.polaris.ipv6.model.LoginModel;
import com.polaris.ipv6.presenter.LoginPresenter;
import com.polaris.ipv6.util.IpAddress;
import com.squareup.okhttp.HttpUrl;
import com.zhy.http.okhttp.OkHttpUtils;
import com.zhy.http.okhttp.callback.StringCallback;


public class LoginModelImpl implements LoginModel {
    LoginPresenter loginPresenter;
    public LoginModelImpl(LoginPresenter loginPresenter){
        this.loginPresenter = loginPresenter;
    }
    @Override
    public void checkPassword(String username,String password) {
        final String url = "http://"+ IpAddress.ipAddress+"/TestIpv6App/LoginServlet";
        OkHttpUtils
                .get()
                .url(url)
                .addParams("username",username)
                .addParams("password",password)
                .build()
                .execute(new StringCallback()
                {
                    @Override
                    public void onError(com.squareup.okhttp.Request request, Exception e) {

                        Log.d("网络接口  ：","读取用户密码信息时出错  "+HttpUrl.parse(url));
                    }
                    @Override
                    public void onResponse(String response)
                    {
                        Log.d("网络接口  ：","网络连接成功");
                        if (response.equals("0")){
                            loginPresenter.showResult(0);
                        }else {
                            loginPresenter.showResult(1);
                        }
                    }

                });
    }
}
