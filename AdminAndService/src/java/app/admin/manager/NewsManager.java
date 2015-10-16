/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.manager;

import app.access.base.NewsAccess;
import app.access.model.News;
import java.util.List;

/**
 *
 * @author YoungKaka
 */
public class NewsManager  extends AbstractManager<News>{
    private NewsAccess access = NewsAccess.getInstance();
    @Override
    public List<News> getAll() {
        return access.all();
    }

    @Override
    public News get(int id) {
        return access.get(id);
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public boolean update(News item) {
          return false;
    }

    @Override
    public List<News> search(String atr, String text) {
          return null;
    }

    @Override
    public void loadNews() {
        
    }
    
}
