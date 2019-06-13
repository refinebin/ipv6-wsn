package com.polaris.ipv6.presenter;

import com.polaris.ipv6.model.LoginModel;
import com.polaris.ipv6.model.impl.LoginModelImpl;
import com.polaris.ipv6.view.LoginView;

public class LoginPresenter {
    private LoginView loginView;
    private LoginModel loginModel;

    public LoginPresenter(LoginView loginView){
        this.loginView = loginView;
        loginModel = new LoginModelImpl(this);
    }

    public void checkPassword(String username,String password){
        loginModel.checkPassword(username,password);
    }

    public void showResult(int result){
        loginView.showResult(result);
    }
}
