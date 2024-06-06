package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Users;
import service.profileService;


@WebServlet(name = "profile", urlPatterns = { "/profile" })
public class profile extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Users> user=(List<Users>) req.getSession().getAttribute("profile");
		req.setAttribute("profile", user);
		req.getRequestDispatcher("/profile.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	    profileService profileservice = new profileService();
//		String username = req.getParameter("username");
//		String password = req.getParameter("password");
//	    req.setAttribute("profile", profileservice.getUserbyUsernameAndPassword(username, password));
//		req.getRequestDispatcher("/profile.jsp").forward(req, resp);
	}
}