package com.marjanepromotion.dao;

import com.marjanepromotion.authentification.IUser;
import com.marjanepromotion.models.Admin;
import com.marjanepromotion.models.Director;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;

import java.util.Optional;

public class AdminDao extends AbstractHibernateDao<Admin> implements IUser<Admin> {

    public AdminDao(){
        setClazz(Admin.class);
    }

    @Override
    public Admin getRecordByEmail(String email){
        Session session = getCurrentSession();
        try{
            return session.createQuery("select a from Admin a where email = :email", Admin.class)
                    .setParameter("email", email)
                    .getSingleResult();

        }catch (NoResultException ex){
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public boolean login(Admin admin) {
        Optional<Admin> adminCheck = Optional.ofNullable(getRecordByEmail(admin.getEmail()));
        return adminCheck.filter(value -> admin.getPassword().equals(value.getPassword())).isPresent();
    }
}
