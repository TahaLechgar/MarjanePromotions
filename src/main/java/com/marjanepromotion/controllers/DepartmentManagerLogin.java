package com.marjanepromotion.controllers;

import com.marjanepromotion.dao.AdminDao;
import com.marjanepromotion.dao.DepartmentManagerDao;
import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.DepartmentManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DepartmentManagerLogin", urlPatterns = {"/login/manager"})
public class DepartmentManagerLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("userType") != null){
            response.sendRedirect("/dashboard/"+request.getSession().getAttribute("userType"));
            return;
        }
        request.setAttribute("userType", "manager");
        request.getRequestDispatcher("/login/Login.jsp").forward(request, response);    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("userType") != null){
            response.getWriter().println("Already logged in as " + request.getSession().getAttribute("userType"));
            return;
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(password == null || email == null){
            response.setStatus(404);
            response.getWriter().println("Incomplete login data");
            return;
        }

        DepartmentManager departmentManager = new DepartmentManager();
        departmentManager.setEmail(email);
        departmentManager.setPassword(password);

        DepartmentManagerDao departmentManagerDao = new DepartmentManagerDao();
        Integer departmentManagerID = departmentManagerDao.login(departmentManager);
        if(departmentManagerID != null){
            HttpSession session = request.getSession();
            DepartmentManager logged = departmentManagerDao.findOne(departmentManagerID);
            session.setAttribute("user", logged);
            session.setAttribute("userType", "manager");
            response.sendRedirect("/dashboard/manager/accepted");
        }else
            response.getWriter().println("Wrong credentials");

    }



}
