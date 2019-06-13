package com.polaris.ipv6.view.viewActivity;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.polaris.ipv6.R;
import com.polaris.ipv6.presenter.LoginPresenter;
import com.polaris.ipv6.util.IpAddress;
import com.polaris.ipv6.view.LoginView;
import com.squareup.okhttp.HttpUrl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import butterknife.BindView;
import butterknife.ButterKnife;

public class LoginActivity extends AppCompatActivity implements LoginView{
    @BindView(R.id.username)
    EditText usernameEd;
    @BindView(R.id.password)
    EditText passwordEd;
    @BindView(R.id.loginButton)
    Button submit;

    LoginPresenter loginPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        ButterKnife.bind(this);
        loginPresenter = new LoginPresenter(this);
        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String username = usernameEd.getText().toString();
                String password = passwordEd.getText().toString();
                checkPassword(username,password);
            }
        });


    }

    @Override
    public void checkPassword(String username,String password) {
        loginPresenter.checkPassword(username,password);
    }

    @Override
    public void showResult(int result) {
        if (result == 0){
            Intent intent = new Intent(LoginActivity.this,MainActivity.class);
            startActivity(intent);
            finish();
        }else {
            Toast.makeText(LoginActivity.this,"账号密码不匹配",Toast.LENGTH_SHORT).show();
        }
    }

}
