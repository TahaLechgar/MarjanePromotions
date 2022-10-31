package com.marjanepromotion.timedTasks;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class Scheduler {
    ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

    //Change here for the hour you want ----------------------------------.at()

    public void setScheduler(){
        Task task = new Task();
        long midnight = LocalDateTime.now().until(LocalDate.now().plusDays(1).atTime(LocalTime.NOON), ChronoUnit.MINUTES);
        scheduler.scheduleAtFixedRate(task, midnight, TimeUnit.DAYS.toMinutes(1), TimeUnit.MINUTES);
    }

}
