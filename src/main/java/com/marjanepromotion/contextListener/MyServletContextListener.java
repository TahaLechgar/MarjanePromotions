package com.marjanepromotion.contextListener;

import com.marjanepromotion.timedTasks.Scheduler;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class MyServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        System.out.println("I'm starting");
        Scheduler scheduler = new Scheduler();
        scheduler.setScheduler();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        System.out.println("I'm shutting down");
    }
}
