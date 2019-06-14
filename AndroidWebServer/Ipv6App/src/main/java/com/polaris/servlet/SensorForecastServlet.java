package com.polaris.servlet;

import com.polaris.entity.SensorForecastEntity;
import com.polaris.service.SensorForecastService;
import com.polaris.service.impl.SensorForecastServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SensorForecastServlet",urlPatterns = {"/SensorForecastServlet"})
public class SensorForecastServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        SensorForecastServiceImpl sensorForecastService = new SensorForecastServiceImpl();
        StringBuffer stringBuffer = sensorForecastService.getAllForecastResult();
        PrintWriter printWriter = response.getWriter();
        printWriter.print(stringBuffer.toString());
    }
}
