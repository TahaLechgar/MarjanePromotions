package com.marjanepromotion.dao;

import com.marjanepromotion.models.Product;

public class ProductDao extends AbstractHibernateDao<Product>{
    public ProductDao(){
        setClazz(Product.class);
    }
}
