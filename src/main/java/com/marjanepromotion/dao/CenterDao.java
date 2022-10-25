package com.marjanepromotion.dao;

import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.Center;

public class CenterDao extends AbstractHibernateDao<Center>{

    public CenterDao(){
        setClazz(Center.class);
    }
}
