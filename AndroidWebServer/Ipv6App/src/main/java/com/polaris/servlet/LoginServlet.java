package com.polaris.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.polaris.service.LoginService;
import com.polaris.service.impl.LoginServiceImpl;
import org.apache.shiro.crypto.hash.SimpleHash;

@WebServlet(name = "LoginServlet",urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String passwd = new SimpleHash("SHA-1", username, password).toString();	//密码加密
        LoginService loginService = new LoginServiceImpl();
        int result = loginService.checkPassword(username,passwd);
        PrintWriter printWriter = response.getWriter();
        printWriter.print(result);
    }
}
