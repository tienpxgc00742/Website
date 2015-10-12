/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author YoungKaka
 */
public abstract class AbstractAccess<T> implements Serializable{
    
    public abstract List<T> all();
    public abstract T get(int id);
    public abstract boolean add(T item);
    public abstract boolean delete(int id);
    public abstract boolean update(T item);
    public abstract List<T> search(String atr,String text);
}
