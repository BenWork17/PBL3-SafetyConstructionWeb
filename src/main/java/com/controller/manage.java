package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import service.CameraProjectService;
import service.manageService;


@WebServlet(name = "manage", urlPatterns = "/manage")
public class manage extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CameraProjectService cameraProjectService = new CameraProjectService();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		manageService managerservice = new manageService();
		req.setAttribute("CameraProject", cameraProjectService.getCameraProject());
		req.setAttribute("User", managerservice.getUser());
		req.getRequestDispatcher("/manage.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
//	public static void main(String[] args) {
//		CameraProjectService cam = new CameraProjectService();
//		List<CameraProject> list = cam.getCameraProjectA("SiteA");
//		for (CameraProject o : list) {
//			System.out.println(o);
//		}
//	}

}

	
