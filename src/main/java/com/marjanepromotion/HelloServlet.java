package com.marjanepromotion;

import java.io.*;
import java.util.Optional;

import com.marjanepromotion.dao.AdminDao;
import com.marjanepromotion.dao.DirectorDao;
import com.marjanepromotion.models.*;
import com.marjanepromotion.util.SessionUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
        director.setEmail("wele@wala.l");
        director.setPassword("test@test.com");

        try {

            Session session = SessionUtil.getCurrentSession();
            session.beginTransaction();
//            session.persist(department);
//            session.persist(center);
//            session.persist(departmentManager);
            DirectorDao directorDao = new DirectorDao();
//            Director director1 = directorDao.getRecordByEmail("wele@wala.l");
//            Optional<Director> optionalDirector = Optional.ofNullable(director1);
//            optionalDirector.ifPresent(director2 -> System.out.println(director2.getEmail()));
//            System.out.println(directorDao.login(director));

            session.getTransaction().commit();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    public void destroy() {
    }
}

