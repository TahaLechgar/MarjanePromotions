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

@WebServlet(name = "AdminDashboard", value = "/AdminDashboard")
public class AdminDashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin logged = (Admin) request.getSession().getAttribute("user");

        CenterDao centerDao = new CenterDao();
        DepartmentDao departmentDao = new DepartmentDao();

        List<Center> centers = centerDao.findAll();
        List<Department> departments = departmentDao.findAll();

        DepartmentManagerDao departmentManagerDao = new DepartmentManagerDao();
        List<DepartmentManager> departmentManagers = departmentManagerDao.findAll();
        PromotionDao promotionDao = new PromotionDao();
        List<Promotion> promotions = promotionDao.findAll();
        promotions = promotions.stream().filter(promotion -> Objects.equals(promotion.getCenter().getId(), logged.getCenter().getId())).collect(Collectors.toList());

        request.setAttribute("departmentManagers", departmentManagers);
        request.setAttribute("promotions", promotions);
        request.setAttribute("centers", centers);
        request.setAttribute("departments", departments);

//        response.getWriter().println(departmentManagers.get(0).getCenter().getCity());
        request.getRequestDispatcher("/dashboard/AdminDashboard.jsp").forward(request, response);
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
            Integer percentage = Integer.parseInt(request.getParameter("percentage"));
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

        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }
}
