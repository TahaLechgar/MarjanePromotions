package com.marjanepromotion.controllers;

import com.marjanepromotion.dao.PromotionDao;
import com.marjanepromotion.models.DepartmentManager;
import com.marjanepromotion.models.Promotion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "DepartmentManagerDashboard", value = "/DepartmentManagerDashboard")
public class DepartmentManagerDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DepartmentManager logged = (DepartmentManager) request.getSession().getAttribute("user");
        PromotionDao promotionDao = new PromotionDao();
        List<Promotion> promotions = promotionDao.findAll();
        promotions = promotions.stream().filter(promotion -> promotion.getDepartment().getId().equals(logged.getDepartment().getId()))
                .collect(Collectors.toList());

        List<Promotion> acceptedPromotions      = promotions.stream().filter(promotion -> promotion.getStatus().equals("accepted")).collect(Collectors.toList());
        List<Promotion> notAcceptedPromotions   = promotions.stream().filter(promotion -> promotion.getStatus().equals("refused") || promotion.getStatus().equals("not-checked")).collect(Collectors.toList());
        List<Promotion> pendingPromotions       = promotions.stream().filter(promotion -> promotion.getStatus().equals("pending")).collect(Collectors.toList());

        request.setAttribute("acceptedPromotions", acceptedPromotions);
        request.setAttribute("notAcceptedPromotions", notAcceptedPromotions);
        request.setAttribute("pendingPromotions", pendingPromotions);

        request.getRequestDispatcher("dashboard/DepartmentManager.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}