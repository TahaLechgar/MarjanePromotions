package com.marjanepromotion.dao;

import com.marjanepromotion.authentification.IUser;
import com.marjanepromotion.models.DepartmentManager;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;

import java.util.Optional;

public class DepartmentManagerDao extends AbstractHibernateDao<DepartmentManager> implements IUser<DepartmentManager> {
    public DepartmentManagerDao(){
        setClazz(DepartmentManager.class);
    }

    @Override
    public DepartmentManager getRecordByEmail(String email){
        Session session = getCurrentSession();
        try{
            session.beginTransaction();
            DepartmentManager departmentManager =  session.createQuery("select d from DepartmentManager d where email = :email", DepartmentManager.class)
                    .setParameter("email", email)
                    .getSingleResult();
            session.getTransaction().commit();
            return departmentManager;

        }catch (NoResultException ex){
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public Integer login(DepartmentManager departmentManager) {
        Optional<DepartmentManager> departmentManagerCheck = Optional.ofNullable(getRecordByEmail(departmentManager.getEmail()));
        if(departmentManagerCheck.filter(value -> departmentManager.getPassword().equals(value.getPassword())).isPresent()) {
            return departmentManagerCheck.get().getId();
        }
        return null;
    }
}
