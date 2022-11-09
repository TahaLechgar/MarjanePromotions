package com.marjanepromotion.controllers;

import com.marjanepromotion.dao.*;
import com.marjanepromotion.dao.DepartmentManagerDao;
import com.marjanepromotion.models.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@WebServlet(name = "AdminDashboard", value = "/dashboard/admin/*")
public class AdminDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // check if the route is correct

        String[] queryParams = request.getRequestURI().split("/");

        //      - check if url parameters is valid
        int pageNumber = 0;
        int rowsPerPage = 8;

        if(queryParams.length > 5 || queryParams.length == 3){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        // check if the third argument of the request is valid
        if(!queryParams[3].equals("managers") && !queryParams[3].equals("promotions") && !queryParams[3].equals("departments")){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        //      - check if pageNumber parameter is an int
        try{
            if(queryParams.length == 5){
                pageNumber = Integer.parseInt(queryParams[4]);
            }
        }catch(NumberFormatException exception){
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }


        // check if user is authenticated as admin
        if(request.getSession().getAttribute("userType") == null){
            response.sendRedirect("/login/admin");
            return;
        }

        if(!request.getSession().getAttribute("userType").equals("admin")){
            response.sendRedirect("/dashboard/"+request.getSession().getAttribute("userType"));
            return;
        }

        String userType = (String)request.getSession().getAttribute("userType");
        if ("department-manager".equals(userType)) {
            response.sendRedirect("/dashboard/department-manager");
            return;
        } else if ("director".equals(userType)) {
            response.sendRedirect("/dashboard/director");
            return;
        }

        // get instance of the logged admin
        Admin logged = (Admin) request.getSession().getAttribute("user");



        CenterDao centerDao = new CenterDao();
        DepartmentDao departmentDao = new DepartmentDao();

        List<Center> centers = centerDao.findAll();
        List<Department> departments = departmentDao.findAll();

        request.setAttribute("centers", centers);
        request.setAttribute("departments", departments);

        int offset = pageNumber*rowsPerPage;
        int max = offset + rowsPerPage;


        // redirect to the appropriate chosen page type with chosen page number
        switch (queryParams[3]) {
            case "managers" -> {
                DepartmentManagerDao departmentManagerDao = new DepartmentManagerDao();
                List<DepartmentManager> departmentManagers = departmentManagerDao.findInRange(offset, max);
                request.setAttribute("dataType", "departmentManagers");
                request.setAttribute("departmentManagers", departmentManagers);
                request.getRequestDispatcher("/dashboard/dashboard.jsp").forward(request, response);
            }
            case "promotions" -> {
                PromotionDao promotionDao = new PromotionDao();
                List<Promotion> promotions = promotionDao.findInRange(offset, max);
                promotions = promotions.stream()
                        .filter(promotion -> Objects.equals(promotion.getCenter().getId(), logged.getCenter().getId()))
                        .collect(Collectors.toList());
                request.setAttribute("dataType", "promotions");
                request.setAttribute("promotions", promotions);
                request.getRequestDispatcher("/dashboard/dashboard.jsp").forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("add-promotion") != null) {

            CenterDao centerDao = new CenterDao();
            DepartmentDao departmentDao = new DepartmentDao();
            PromotionDao promotionDao = new PromotionDao();


            String startDate = request.getParameter("start-date");
            String endDate = request.getParameter("end-date");
            String description = request.getParameter("description");
            int percentage = Integer.parseInt(request.getParameter("percentage"));
            if(percentage > 50){
                request.setAttribute("error", "la promotion ne doit pas dépasser 50%");
                doGet(request, response);
                return;
            }
            int centerId = Integer.parseInt(request.getParameter("center"));
            int departmentId = Integer.parseInt(request.getParameter("department"));

            Center center = centerDao.findOne(centerId);
            Department department = departmentDao.findOne(departmentId);
            Promotion promotion = new Promotion();

            promotion.setCenter(center);
            promotion.setDepartment(department);
            promotion.setStartDate(LocalDate.parse(startDate));
            promotion.setEndDate(LocalDate.parse(endDate));
            promotion.setPercentage(percentage);
            promotion.setDescription(description);
            promotion.setStatus("pending");

            promotion = promotionDao.create(promotion);

            doGet(request, response);

        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
}
