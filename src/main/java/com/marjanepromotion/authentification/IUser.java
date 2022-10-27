package com.marjanepromotion.authentification;


public interface IUser<T>{
    public T getRecordByEmail(String email);
    public Integer login(T entity);

}