package com.controller;

import java.io.IOException;
import java.util.ArrayList;
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
        List<CameraError> cameraErrors = new ArrayList<>();
        cameraErrors = statisticService.getAlertbyTimestamp_Statistics(Camera_Name, fromDate, toDate);
		Map<String, List<CameraError>> partitionedMap = statisticService.partitionByErrorType(cameraErrors);

		// Lấy ra 3 List tương ứng với mỗi error_type
		List<CameraError> list1 = partitionedMap.get("area");
		List<CameraError> list2 = partitionedMap.get("body");
		List<CameraError> list3 = partitionedMap.get("machine");
		int[] detections1 = new int[7];
		int[] detections2 = new int[7];
		int[] detections3 = new int[7];
		detections1 = StatisticService.countByWeekday(list1);
		detections2 = StatisticService.countByWeekday(list2);
		detections3 = StatisticService.countByWeekday(list3);
		req.setAttribute("Static1", detections1);
		req.setAttribute("Static2", detections2);
		req.setAttribute("Static3", detections3);
        req.getRequestDispatcher("/statistics.jsp").forward(req, resp); 
	}
	

	
}
