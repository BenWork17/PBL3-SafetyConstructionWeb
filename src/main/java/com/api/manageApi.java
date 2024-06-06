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
@WebServlet(name = "adduser", urlPatterns = { "/api/deleteuser", "/api/adduser" , "/api/modifyuser" })
public class manageApi extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private manageService manageservice = new manageService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	@Override

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String urlPath = req.getServletPath();
		switch (urlPath) {
		case "/api/deleteuser":
			int id = Integer.parseInt(req.getParameter("id"));
			
			boolean isSuccess = manageservice.deleteUserById(id);
			break;
		case "/api/adduser":
			String username = req.getParameter("username");
			String fullname = req.getParameter("fullname");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
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
			boolean isAdd = manageservice.addUser(username, fullname, email, phone, password, roleid);
			break;
		case "/api/modifyuser":
			int userid = Integer.parseInt(req.getParameter("userid"));
			String username1 = req.getParameter("username");
			String fullname1 = req.getParameter("fullname");
			String email1 = req.getParameter("email");
			String phone1 = req.getParameter("phone");
			String password1 = req.getParameter("password");
			int roleid1 = 2; // hoặc một giá trị mặc định nào đó
			try {
				String roleidStr = req.getParameter("roleid");
				if (roleidStr != null) {
					roleid = Integer.parseInt(roleidStr);
				}
			} catch (NumberFormatException e) {
				// Xử lý lỗi khi không thể chuyển đổi chuỗi sang số nguyên
				e.printStackTrace(); // hoặc log lỗi tùy thuộc vào hệ thống logging của bạn
			}
			boolean ismodify = manageservice.modifyUser(userid,username1,fullname1, email1, phone1, password1, roleid1);
			break;
		}

	}
}
