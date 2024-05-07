package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CameraProjectService;


@WebServlet(name = "multi_cctv", urlPatterns = "/multi_cctv")
public class multi_cctv extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CameraProjectService cameraProjectService = new CameraProjectService();
	@Override
	protected void doHead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/multi_cctv.jsp").forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CameraProjectService cameraProjectService = new CameraProjectService();
		req.setAttribute("CameraProject", cameraProjectService.getCameraProject());
	
	}
	

}

	
