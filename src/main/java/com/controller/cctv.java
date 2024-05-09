package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CameraErrorService;

@WebServlet(name = "cctv", urlPatterns = "/cctv")
public class cctv extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CameraErrorService cameraErrorService = new CameraErrorService();

	@Override
	protected void doHead(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/cctv.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Camera_name = "bao";
		String Project_name = "B";
		req.setAttribute("CameraProject", cameraErrorService.getCameraError(Camera_name, Project_name));

	}

}
