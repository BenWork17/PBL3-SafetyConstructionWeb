package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;
import service.loginService;

@WebServlet(name = "login", urlPatterns = { "/login" })
public class login extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private loginService loginService = new loginService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}

	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		boolean isLogin = loginService.checkLogin(username, password);
		if (isLogin) {
//			HttpSession session = (HttpSession) req.getSession();
//			session.setAttribute("acc", loginService.getUserByUsernamAndPassword(username, password));
			resp.sendRedirect(req.getContextPath() + "/dashboard");
			} else {
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
		}

	}
}
