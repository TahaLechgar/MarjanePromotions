package com.marjanepromotion.dao;

import com.marjanepromotion.models.Director;

public class DirectorDao extends AbstractHibernateDao<Director> {

    public DirectorDao(){
        setClazz(Director.class);
    }
}
