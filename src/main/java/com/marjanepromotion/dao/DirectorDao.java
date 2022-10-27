package com.marjanepromotion.dao;

import com.marjanepromotion.authentification.IUser;
import com.marjanepromotion.models.Director;
import jakarta.persistence.NoResultException;
import org.hibernate.Session;

import java.util.Objects;
import java.util.Optional;

public class DirectorDao extends AbstractHibernateDao<Director> implements IUser<Director> {


    public DirectorDao(){
        setClazz(Director.class);
    }

    @Override
    public Director getRecordByEmail(String email){
        Session session = getCurrentSession();
        try{
            session.beginTransaction();
            Director director =  session.createQuery("select d from Director d where email = :email", Director.class)
                    .setParameter("email", email)
                    .getSingleResult();
            session.getTransaction().commit();
            session.close();
            return director;

        }catch (NoResultException ex){
            System.out.println(ex.getMessage());
            return null;
        }
    }

    @Override
    public Integer login(Director director) {
        Optional<Director> directorCheck = Optional.ofNullable(getRecordByEmail(director.getEmail()));
        if(directorCheck.filter(value -> director.getPassword().equals(value.getPassword())).isPresent()) {
            return directorCheck.get().getId();
        }
        return null;
    }
}
