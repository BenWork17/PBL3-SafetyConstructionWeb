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

import model.Detective;
import service.dashboardService;

/**
 * Servlet implementation class History
 */
@WebServlet(name = "dashboard", urlPatterns = "/dashboard")
public class dashboard extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private dashboardService dashboardService = new dashboardService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		dashboardService db = new dashboardService();
		List<Detective> list = db.getDetective();
		int[] detections = new int[7];
		detections = db.count(list);
        Map<String, int[]> monthlyReportData = dashboardService.getMonthlyReportData(list);

		
		req.setAttribute("detective", dashboardService.getDetective());
		req.setAttribute("detectiveStatic", detections);
        req.setAttribute("monthlyReportData", new Gson().toJson(monthlyReportData));

		req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
        System.out.println("Detections array:");
        for (int i = 0; i < detections.length; i++) {
            System.out.println("Detection " + i + ": " + detections[i]);
        }
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
