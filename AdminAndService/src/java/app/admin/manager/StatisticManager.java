/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.manager;

import app.access.base.StatisticAccess;
import app.access.model.Statistic;
import java.util.List;

/**
 *
 * @author YoungKaka
 */
public class StatisticManager extends AbstractManager<Statistic>{

    private final StatisticAccess access = StatisticAccess.getInstance();
    @Override
    public List<Statistic> getAll() {
       return access.all();
    }

    @Override
    public Statistic get(int id) {
       return access.get(id);
    }
    @Override
    public boolean delete(int id) {
       return access.delete(id);
    }

    @Override
    public boolean update(Statistic item) {
       return access.update(item);
    }

    @Override
    public List<Statistic> search(String atr, String text) {
       return access.search(atr, text);
    }

    @Override
    public void loadNews() {
       
    }
    
}
