package com.polaris.servlet;

import com.polaris.service.SensorRecordService;
import com.polaris.service.impl.SensorForecastServiceImpl;
import com.polaris.service.impl.SensorRecordServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SensorRecordServlet",urlPatterns = {"/SensorRecordServlet"})
public class SensorRecordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sensorId =  request.getParameter("sensorId");
        System.out.println("sen  "+sensorId);
        SensorRecordServiceImpl sensorRecordService = new SensorRecordServiceImpl();
        StringBuffer stringBuffer = sensorRecordService.getAllSensorRecord(sensorId);
        PrintWriter printWriter = response.getWriter();
        printWriter.print(stringBuffer.toString());
    }
}
