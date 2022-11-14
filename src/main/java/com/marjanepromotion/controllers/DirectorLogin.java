package com.marjanepromotion.controllers;

import com.marjanepromotion.dao.DirectorDao;
import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.Director;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DirectorLogin", urlPatterns = {"/login/director"})
public class DirectorLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("userType") != null){
            response.getWriter().println("Already logged in as " + request.getSession().getAttribute("userType"));
            return;
        }
        request.setAttribute("userType", "director");
        request.setAttribute("otherType1", "manager");
        request.setAttribute("otherType2", "admin");
        request.getRequestDispatcher("/login/Login.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("userType") != null){
            response.sendRedirect("/dashboard/"+request.getSession().getAttribute("userType"));
            return;
        }
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email == null || password == null){
            response.setStatus(404);
            response.getWriter().println("Incomplete login data");
            return;
        }

        Director director = new Director();
        director.setEmail(email);
        director.setPassword(password);

        DirectorDao directorDao = new DirectorDao();
        Integer directorID = directorDao.login(director);

        if(directorID != null){
            HttpSession session = request.getSession();
            session.setAttribute("userType", "director");
            Director logged = directorDao.findOne(directorID);
            session.setAttribute("user", logged);
            response.sendRedirect("/dashboard/director");
        }else
            response.getWriter().println("Wrong credentials");

    }



}
