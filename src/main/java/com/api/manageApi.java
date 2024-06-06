package com.api;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.manageService;

/**
 * Servlet implementation class manageApi
 */
@WebServlet(name = "adduser", urlPatterns = { "/api/deleteuser", "/api/adduser" })
public class manageApi extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private manageService manageservice = new manageService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
<<<<<<< HEAD
	}
=======
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */	
		}
>>>>>>> 880b717d6a4a43b1b3b72b88578c386931ae2abe

	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String urlPath = req.getServletPath();
		switch(urlPath) {
		case  "/api/deleteuser":
			int id = Integer.parseInt(req.getParameter("id"));
			boolean isSuccess = manageservice.deleteUserById(id); 
			break;
		case "/api/adduser":
			String username = req.getParameter("username");
			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			String phone  = req.getParameter("phone");
			String password  = req.getParameter("password");
			int roleid = 2; // hoặc một giá trị mặc định nào đó
			try {
			    String roleidStr = req.getParameter("roleid");
			    if (roleidStr != null) {
			        roleid = Integer.parseInt(roleidStr);
			    }
			} catch (NumberFormatException e) {
			    // Xử lý lỗi khi không thể chuyển đổi chuỗi sang số nguyên
			    e.printStackTrace(); // hoặc log lỗi tùy thuộc vào hệ thống logging của bạn
			}
			boolean isAdd = manageservice.addUser(username, fullname , email , phone , password , roleid); 
			break;
		}



	}
}
