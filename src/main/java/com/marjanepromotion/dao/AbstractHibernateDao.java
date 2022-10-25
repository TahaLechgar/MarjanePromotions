package com.marjanepromotion.dao;
//
//
//import com.marjanepromotion.util.SessionUtil;
//import org.hibernate.Session;
//
//public abstract class AbstractHibernateDAO<T> {
//
//
//    public void insert(T entity)  {
//
//        try{
//            Session session = getCurrentSession();
//            session.getTransaction();
//            session.persist(entity);
//            session.getTransaction().commit();
//            session.close();
//
//        }catch (Exception exception){
//            System.out.println("insert exception : " + exception.getMessage());
//        }
//
//    }
//
//    public void update(T entity) {
//        try {
//
//
//        }catch (Exception exception){
//            System.out.println("update exception : " + exception.getMessage());
//        }
//    }
//
//    private Session getCurrentSession() throws Exception{
//        return SessionUtil.getCurrentSession();
//    }
//
//}

import com.marjanepromotion.util.SessionUtil;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.postgresql.shaded.com.ongres.scram.common.util.Preconditions;

import java.io.Serializable;
import java.util.List;

public abstract class AbstractHibernateDao<T extends Serializable> {
    private Class<T> clazz;

    protected SessionFactory sessionFactory;

    public final void setClazz(final Class<T> clazzToSet) {

        try{
            if(clazzToSet == null){
                throw new NullPointerException();
            }
            clazz = clazzToSet;
        }catch(Exception exception){
            System.out.println(exception.getMessage());
        }

    }

    // API
    public T findOne(final long id) {
        return (T) getCurrentSession().get(clazz, id);
    }

    public List<T> findAll() {
        Session session = getCurrentSession();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(clazz);
        Root<T> rootEntry = cq.from(clazz);
        CriteriaQuery<T> all = cq.select(rootEntry);

        TypedQuery<T> allQuery = session.createQuery(all);
        return allQuery.getResultList();
    }

    public T create(final T entity) {
        try{
            if(entity == null){
                throw new NullPointerException();
            }
            getCurrentSession().persist(entity);
            return entity;
        }catch(Exception exception){
            System.out.println(exception.getMessage());
            return null;
        }

    }

    public T update(final T entity) {
        try{
            if(entity == null){
                throw new NullPointerException();
            }
            return (T) getCurrentSession().merge(entity);
        }catch(Exception exception){
            System.out.println(exception.getMessage());
            return null;
        }
    }

    public void delete(final T entity) {
        try{
            if(entity == null){
                throw new NullPointerException();
            }
            getCurrentSession().remove(entity);
        }catch(Exception exception){
            System.out.println(exception.getMessage());
        }
    }

    public void deleteById(final long entityId) {
        final T entity = findOne(entityId);
        try{
            if(entity == null){
                throw new NullPointerException();
            }
            delete(entity);
        }catch(Exception exception){
            System.out.println(exception.getMessage());
        }
    }

    protected Session getCurrentSession() {
        return SessionUtil.getCurrentSession();
    }
}
