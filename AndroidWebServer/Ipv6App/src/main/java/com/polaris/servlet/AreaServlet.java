package com.polaris.servlet;

import com.polaris.entity.AreaEntity;
import com.polaris.service.impl.AreaServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AreaServlet",urlPatterns = {"/AreaServlet"})
public class AreaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        AreaServiceImpl areaService = new AreaServiceImpl();
        StringBuffer stringBuffer = areaService.getAllSensorRecord();
        PrintWriter printWriter = response.getWriter();
        printWriter.print(stringBuffer);
    }
}
