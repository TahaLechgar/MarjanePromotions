package com.marjanepromotion.controllers;

import com.marjanepromotion.dao.PromotionDao;
import com.marjanepromotion.dao.RefusedPromotionDao;
import com.marjanepromotion.models.DepartmentManager;
import com.marjanepromotion.models.Promotion;
import com.marjanepromotion.models.RefusedPromotion;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "DepartmentManagerDashboard", value = "/dashboard/manager/*")
public class DepartmentManagerDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // check if the route is correct

        String[] queryParams = request.getRequestURI().split("/");

        //      - check if url parameters is valid
        int pageNumber = 1;
        int rowsPerPage = 8;

        if(queryParams.length > 5 || queryParams.length == 3){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // check if the forth argument of the request is valid
        if(queryParams.length < 4 || !queryParams[3].equals("accepted") && !queryParams[3].equals("not-accepted") && !queryParams[3].equals("pending")){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        //      - check if pageNumber parameter is an int
        try{
            if(queryParams.length == 5){
                pageNumber = Integer.parseInt(queryParams[4]);
                if(pageNumber <= 0)
                    throw new NumberFormatException();
            }
        }catch(NumberFormatException exception){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }


        if(request.getSession().getAttribute("userType") == null){
            response.sendRedirect("/login/manager");
            return;
        }

        if(!request.getSession().getAttribute("userType").equals("manager")){
            response.sendRedirect("/dashboard/" + request.getSession().getAttribute("userType"));
            return;
        }


        ArrayList<String> links = new ArrayList<>();
        links.add("accepted");
        links.add("pending");
        links.add("not-accepted");

        request.setAttribute("links", links);
        request.setAttribute("dashboardType", "manager");


        DepartmentManager logged = (DepartmentManager) request.getSession().getAttribute("user");
        PromotionDao promotionDao = new PromotionDao();
        List<Promotion> promotions = promotionDao.findAll();
        promotions = promotions.stream()
                .filter(promotion -> promotion.getDepartment().getId().equals(logged.getDepartment().getId()))
                .collect(Collectors.toList());

        switch(queryParams[3]){
            case "accepted" -> {
                promotions = promotions.stream().filter(promotion -> promotion.getStatus().equals("accepted")).collect(Collectors.toList());
                request.setAttribute("dataType", "accepted");
            }

            case "not-accepted" -> {
                promotions = promotions.stream().filter(promotion -> promotion.getStatus().equals("refused") || promotion.getStatus().equals("not-checked")).collect(Collectors.toList());
                request.setAttribute("dataType", "not-accepted");
            }

            case "pending" -> {
                promotions = promotions.stream().filter(promotion -> promotion.getStatus().equals("pending")).collect(Collectors.toList());
                request.setAttribute("dataType", "pending");
            }
        }

        request.setAttribute("promotions",promotions);

        request.getRequestDispatcher("/dashboard/dashboard.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("accept") != null){
            int promotionId = Integer.parseInt(request.getParameter("accept"));

            PromotionDao promotionDao = new PromotionDao();
            Promotion promotion = promotionDao.findOne(promotionId);

            promotion.setStatus("accepted");
            promotion = promotionDao.update(promotion);
        }else if(request.getParameter("refuse") != null){
            int promotionId = Integer.parseInt(request.getParameter("refuse"));

            PromotionDao promotionDao = new PromotionDao();
            RefusedPromotionDao refusedPromotionDao = new RefusedPromotionDao();


            Promotion promotion = promotionDao.findOne(promotionId);
            RefusedPromotion refusedPromotion = new RefusedPromotion();

            String reason =  request.getParameter("reason");

            refusedPromotion.setPromotion(promotion);
            refusedPromotion.setReason(reason);
            refusedPromotionDao.create(refusedPromotion);


            promotion.setStatus("refused");
            promotion = promotionDao.update(promotion);
            doGet(request, response);

        }

    }
}