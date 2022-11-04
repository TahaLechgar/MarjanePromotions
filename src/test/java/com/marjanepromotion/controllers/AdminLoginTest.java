package com.marjanepromotion.controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

class AdminLoginTest {

    AdminLogin adminLogin = new AdminLogin();

    HttpServletRequest request = Mockito.mock(HttpServletRequest.class);
    HttpServletResponse response = Mockito.mock(HttpServletResponse.class);
    RequestDispatcher requestDispatcher = Mockito.mock(RequestDispatcher.class);
    HttpSession session = Mockito.mock(HttpSession.class);
    PrintWriter writer = Mockito.mock(PrintWriter.class);

    @Test
    void doGet() throws ServletException, IOException {

        when(request.getRequestDispatcher("/login/Login.jsp")).thenReturn(requestDispatcher);
        when(request.getSession()).thenReturn(session);
        when(response.getWriter()).thenReturn(writer);

        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);

        when(response.getWriter()).thenReturn(printWriter);

        adminLogin.doGet(request, response);

        String result = stringWriter.getBuffer().toString().trim();

        assertEquals("tetete", result);

    }
}