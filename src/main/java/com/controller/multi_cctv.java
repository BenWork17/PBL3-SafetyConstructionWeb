package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.RequestDispatcher;
import model.CameraProject;
import repository.CameraProjectRepository;
import service.CameraProjectService;


@WebServlet(name = "multi_cctv", urlPatterns = "/mutil_cctv")
public class multi_cctv extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CameraProjectService cameraProjectService = new CameraProjectService();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setAttribute("CameraProject", cameraProjectService.getCameraProject());
		req.setAttribute("CameraProjectA", cameraProjectService.getCameraProjectA("SiteA"));
		req.setAttribute("CameraProjectB", cameraProjectService.getCameraProjectA("SiteB"));
		req.getRequestDispatcher("/mutil_cctv.jsp").forward(req, resp);
	}
	public static void main(String[] args) {
		CameraProjectService cam = new CameraProjectService();
		List<CameraProject> list = cam.getCameraProjectA("SiteA");
		for (CameraProject o : list) {
			System.out.println(o);
		}
	}

}

	
