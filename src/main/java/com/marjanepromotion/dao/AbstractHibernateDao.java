package com.marjanepromotion.dao;

import com.marjanepromotion.util.SessionUtil;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;





import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

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
        Session session = getCurrentSession();
        session.beginTransaction();
        T record = (T) session.get(clazz, id);
        session.getTransaction().commit();
        session.close();
        return record;
    }

    public long count() {
        Session session = getCurrentSession();
        session.beginTransaction();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Long> criteria = builder.createQuery(Long.class);
        criteria.select(builder.count(criteria.from(clazz)));
        TypedQuery<Long> query = session.createQuery(criteria);
        long count = query.getSingleResult();
        session.getTransaction().commit();
        session.close();
        return count;
    }

    public List<T> findInRange(int offset, int max){
        Session session = getCurrentSession();
        session.beginTransaction();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(clazz);
        Root<T> rootEntry = cq.from(clazz);
        CriteriaQuery<T> all = cq.select(rootEntry);

        TypedQuery<T> typedQuery = session.createQuery(all);
        typedQuery.setFirstResult(offset);
        typedQuery.setMaxResults(max);
        List<T> resultList = typedQuery.getResultList();
        session.getTransaction().commit();
        session.close();
        return resultList;


    }


    public List<T> findAll() {
        Session session = getCurrentSession();
        session.beginTransaction();
        CriteriaBuilder cb = session.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(clazz);
        Root<T> rootEntry = cq.from(clazz);
        CriteriaQuery<T> all = cq.select(rootEntry);

        TypedQuery<T> allQuery = session.createQuery(all);
        List<T> resultList = allQuery.getResultList();
        session.getTransaction().commit();
        session.close();
        return resultList;
    }

    public T create(final T entity) {
        try{
            if(entity == null){
                throw new NullPointerException();
            }
            Session session = getCurrentSession();
            session.beginTransaction();
            session.persist(entity);
            session.getTransaction().commit();
            session.close();
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
            Session session = getCurrentSession();
            session.beginTransaction();
            T result = session.merge(entity);
            session.getTransaction().commit();
            session.close();
            return result;
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
