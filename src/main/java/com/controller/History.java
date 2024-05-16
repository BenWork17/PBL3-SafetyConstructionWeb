package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.HistoryService;

/**
 * Servlet implementation class History
 */
@WebServlet(name = "history", urlPatterns = "/history")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HistoryService historyService = new HistoryService();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.getRequestDispatcher("/history.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Camera_Name = req.getParameter("customSelect1a");
		String Project_camera =req.getParameter("customSelect2a");
        String fromDate = req.getParameter("fromDate");
        String toDate = req.getParameter("toDate");
        fromDate = historyService.convertDateFormat(fromDate);
        toDate = historyService.convertDateFormat(toDate);

        
        System.out.println("From Date: " + Camera_Name);
        System.out.println("To Date: " + Project_camera);
        System.out.println("From Date: " + fromDate);
        System.out.println("To Date: " + toDate);
        

        // Tiếp tục xử lý các giá trị từ ngày ở đây...
	
	}

}
