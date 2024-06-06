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
		List<Detective> list1 = db.getDetectiveByErrortype("body");
		List<Detective> list2 = db.getDetectiveByErrortype("area");
		List<Detective> list3 = db.getDetectiveByErrortype("machine");
		
		int[] detections1 = new int[7];
		int[] detections2 = new int[7];
		int[] detections3 = new int[7];
		detections1 = db.count(list1);
		detections2 = db.count(list2);
		detections3 = db.count(list3);
        Map<String, int[]> monthlyReportData = dashboardService.getMonthlyReportData(list);

		
		req.setAttribute("detective", dashboardService.getDetective());
		req.setAttribute("detectiveStatic1", detections1);
		req.setAttribute("detectiveStatic2", detections2);
		req.setAttribute("detectiveStatic3", detections3);
        req.setAttribute("monthlyReportData", new Gson().toJson(monthlyReportData));

		req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
//        System.out.println("Detections array:");
//        for (int i = 0; i < detections.length; i++) {
//            System.out.println("Detection " + i + ": " + detections[i]);
//        }
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
