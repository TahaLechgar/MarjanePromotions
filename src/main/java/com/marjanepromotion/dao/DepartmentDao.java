package com.marjanepromotion.dao;

import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.Department;

public class DepartmentDao extends AbstractHibernateDao<Department>{
    public DepartmentDao(){
        setClazz(Department.class);
    }
}
