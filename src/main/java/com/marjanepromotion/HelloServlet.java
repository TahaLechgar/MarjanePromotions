package com.marjanepromotion;

import java.io.*;

import com.marjanepromotion.models.Center;
import com.marjanepromotion.models.Department;
import com.marjanepromotion.models.DepartmentManager;
import com.marjanepromotion.models.Director;
import com.marjanepromotion.util.SessionUtil;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");


        Department department = new Department();
        department.setName("Multimedia");

        Center center = new Center();
        center.setCity("Safi");


        DepartmentManager departmentManager = new DepartmentManager();
        departmentManager.setDepartment(department);
        departmentManager.setEmail("test");
        departmentManager.setPassword("test");
        departmentManager.setCenter(center);

        Director director = new Director();
        director.setEmail("hehe@bo.y");
        director.setPassword("password");


        try {

            Session session = SessionUtil.getCurrentSession();
            session.beginTransaction();
            session.persist(department);
            session.persist(center);
            session.persist(departmentManager);
            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public void destroy() {
    }
}

