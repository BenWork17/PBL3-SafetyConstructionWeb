package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.CameraError;
import service.CameraProjectService;
import service.StatisticService;

/**
 * Servlet implementation class History
 */
@WebServlet(name = "statistics", urlPatterns = "/statistics")
public class Statistics extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StatisticService statisticService = new StatisticService();
	private CameraProjectService cameraProjectService = new CameraProjectService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("CameraProject_Statistics", cameraProjectService.getCameraProject());
		req.getRequestDispatcher("/statistics.jsp").forward(req, resp);
		//adchart
        String cameraName = req.getParameter("cameraName");
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("CameraProject_Statistics", cameraProjectService.getCameraProject());

		String Camera_Name = req.getParameter("customSelect1a");
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        fromDate = statisticService.convertDateFormat(fromDate);
        toDate = statisticService.convertDateFormat(toDate);
        req.setAttribute("ErrorByDate_Statistics", statisticService.getAlertbyTimestamp_Statistics(Camera_Name, fromDate, toDate));
        req.getRequestDispatcher("/statistics.jsp").forward(req, resp); 
	}
	

	
}
