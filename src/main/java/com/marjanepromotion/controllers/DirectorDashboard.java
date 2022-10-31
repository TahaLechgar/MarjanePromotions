package com.marjanepromotion.controllers;

import com.marjanepromotion.dao.AdminDao;
import com.marjanepromotion.dao.PromotionDao;
import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.Director;
import com.marjanepromotion.models.Promotion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "DirectorDashboard", value = "/dashboard/director")
public class DirectorDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getSession().getAttribute("userType") == null){
            response.sendRedirect("/login/director");
            return;
        }

        if(!request.getSession().getAttribute("userType").equals("director")){
            response.sendRedirect("/dashboard/"+request.getSession().getAttribute("userType"));
            return;
        }

        Director logged = (Director) request.getSession().getAttribute("user");
        AdminDao adminDao = new AdminDao();
        PromotionDao promotionDao = new PromotionDao();
        List<Admin> admins = adminDao.findAll();
        List<Promotion> promotions = promotionDao.findAll();

        List<Promotion> acceptedPromotions      = promotions.stream().filter(promotion -> promotion.getStatus().equals("accepted")).collect(Collectors.toList());
        List<Promotion> notAcceptedPromotions   = promotions.stream().filter(promotion -> promotion.getStatus().equals("refused") || promotion.getStatus().equals("not-checked")).collect(Collectors.toList());
        List<Promotion> pendingPromotions       = promotions.stream().filter(promotion -> promotion.getStatus().equals("pending")).collect(Collectors.toList());

        request.setAttribute("admins", admins);
        request.setAttribute("acceptedPromotions", acceptedPromotions);
        request.setAttribute("notAcceptedPromotions", notAcceptedPromotions);
        request.setAttribute("pendingPromotions", pendingPromotions);

        request.getRequestDispatcher("/dashboard/DirectorDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}