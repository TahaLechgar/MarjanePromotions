package com.marjanepromotion.timedTasks;

import com.marjanepromotion.dao.PromotionDao;
import com.marjanepromotion.models.Promotion;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

public class Task implements Runnable {

    @Override
    public void run() {
        System.out.println("I'm running daily at afternoon");

        PromotionDao promotionDao = new PromotionDao();

        List<Promotion> promotions = promotionDao.findAll();
        promotions = promotions
                .stream()
                .filter(promotion -> promotion.getStatus().equals("pending") && promotion.getStartDate().isBefore(LocalDate.now()))
                .collect(Collectors.toList());
        promotions.forEach(promotion -> promotion.setStatus("not-checked"));

        promotions.forEach(promotion -> {
            Promotion update = promotionDao.update(promotion);
        });


    }
}
