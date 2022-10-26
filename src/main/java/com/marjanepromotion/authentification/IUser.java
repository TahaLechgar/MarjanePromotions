package com.marjanepromotion.authentification;


public interface IUser<T>{
    public T getRecordByEmail(String email);
    public boolean login(T entity);

}