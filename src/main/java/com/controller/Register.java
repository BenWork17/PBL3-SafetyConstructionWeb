package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.RegisterService;


@WebServlet(name = "Register", urlPatterns = { "/register" })
public class Register extends HttpServlet {
    private RegisterService registerService = new RegisterService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("Username");
        String fullname = req.getParameter("Fullname");
        String email = req.getParameter("Email");
        String phone = req.getParameter("Phone");
        String password = req.getParameter("Password");
        RegisterService registerService = new RegisterService();

        boolean isRegistered = registerService.registerCheck(username, fullname, email, phone, password);
        if (isRegistered) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
        } else {
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }
}
