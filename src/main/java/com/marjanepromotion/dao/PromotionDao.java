package com.marjanepromotion.dao;

import com.marjanepromotion.models.Promotion;

public class PromotionDao extends AbstractHibernateDao<Promotion>{

    public PromotionDao(){
        setClazz(Promotion.class);
    }
}
