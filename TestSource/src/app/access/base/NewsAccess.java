/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import app.access.model.News;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author YoungKaka
 */
public class NewsAccess extends AbstractAccess<News>{

    public static void main(String[] args) {
        System.out.println(NewsAccess.getInstance().all().size());
        System.out.println(NewsAccess.getInstance().get(10011).getTitle());
    }
    private static final NewsAccess instance = new NewsAccess();

    private NewsAccess() {
        
    }

    public static NewsAccess getInstance() {
        return instance;
    }
    
    @Override
    public List<News> all() {
        List<News> list = new ArrayList<>();
           String query = "Select * from tna_news";
        try {
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();     
            while(rs.next()){
                list.add(new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5), rs.getString(6), rs.getInt(7)));
            }
             rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsAccess.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return list;
    }

    @Override
    public News get(int id) {
        News item = null;
            String query = "Select * from tna_news where id=?";
        try {
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();    
            while(rs.next()){
  
                item = new News(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5), rs.getString(6), rs.getInt(7));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(NewsAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item;
    }

    @Override
    public boolean add(News item) {
        return false;
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
    
}
