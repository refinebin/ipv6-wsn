package com.polaris.servlet;

import com.polaris.service.impl.AreaServiceImpl;
import com.polaris.service.impl.FireRecordServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "FireRecordServlet",urlPatterns = {"/FireRecordServlet"})
public class FireRecordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        FireRecordServiceImpl fireRecordService = new FireRecordServiceImpl();
        StringBuffer stringBuffer = fireRecordService.getAllFireRecordInfo();
        PrintWriter printWriter = response.getWriter();
        printWriter.print(stringBuffer);
    }
}
