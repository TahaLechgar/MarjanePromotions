package com.marjanepromotion.controllers;

import com.marjanepromotion.dao.AdminDao;
import com.marjanepromotion.dao.DepartmentManagerDao;
import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.DepartmentManager;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DepartmentManagerLogin", urlPatterns = {"/login/department-manager"})
public class DepartmentManagerLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession(false) != null){
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
        if(departmentManagerDao.login(departmentManager)){
            HttpSession session = request.getSession();
            session.setAttribute("userType", "department-manager");
            response.getWriter().println("Session Created with " + session.getId());
        }else
            response.getWriter().println("Session is not created");

    }



}
