package com.marjanepromotion.dao;

import com.marjanepromotion.models.RefusedPromotion;

public class RefusedPromotionDao extends AbstractHibernateDao<RefusedPromotion>  {

    public RefusedPromotionDao() {
        setClazz(RefusedPromotion.class);
    }
}
