package com.marjanepromotion.controllers;

import com.marjanepromotion.dao.DepartmentManagerDao;
import com.marjanepromotion.dao.DepartmentManagerDao;
import com.marjanepromotion.dao.PromotionDao;
import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.DepartmentManager;
import com.marjanepromotion.models.Director;
import com.marjanepromotion.models.Promotion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@WebServlet(name = "AdminDashboard", value = "/AdminDashboard")
public class AdminDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin logged = (Admin) request.getSession().getAttribute("user");
        DepartmentManagerDao departmentManagerDao = new DepartmentManagerDao();
        List<DepartmentManager> departmentManagers = departmentManagerDao.findAll();
        PromotionDao promotionDao = new PromotionDao();
        List<Promotion> promotions = promotionDao.findAll();
        promotions = promotions.stream().filter(promotion -> Objects.equals(promotion.getCenter().getId(), logged.getCenter().getId())).collect(Collectors.toList());

        request.setAttribute("departmentManagers", departmentManagers);
        request.setAttribute("promotions", promotions);

//        response.getWriter().println(departmentManagers.get(0).getCenter().getCity());
        request.getRequestDispatcher("/dashboard/AdminDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
}
