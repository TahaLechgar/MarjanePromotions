package com.marjanepromotion.dao;

import com.marjanepromotion.models.Admin;

public class AdminDao extends AbstractHibernateDao<Admin>{

    public AdminDao(){
        setClazz(Admin.class);
    }
}
