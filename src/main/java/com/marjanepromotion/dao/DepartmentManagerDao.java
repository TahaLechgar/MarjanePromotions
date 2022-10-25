package com.marjanepromotion.dao;

import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.DepartmentManager;

public class DepartmentManagerDao extends AbstractHibernateDao<DepartmentManager>{
    public DepartmentManagerDao(){
        setClazz(DepartmentManager.class);
    }
}
