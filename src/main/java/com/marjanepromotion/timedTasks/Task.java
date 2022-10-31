package com.marjanepromotion.timedTasks;

public class Task implements Runnable {

    @Override
    public void run() {
        System.out.println("I'm running daily");
    }
}
