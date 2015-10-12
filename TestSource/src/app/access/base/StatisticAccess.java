/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import app.access.model.Statistic;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author YoungKaka
 */
public class StatisticAccess extends AbstractAccess<Statistic> {

    public static void main(String[] args) {
       // System.out.println(StatisticAccess.getInstance().all().size());
       // System.out.println(StatisticAccess.getInstance().increaseLoginRequest(2));
       // System.out.println(StatisticAccess.getInstance().increaseApiRequest("saresdsasasdw"));
       System.out.println(StatisticAccess.getInstance().add(new Statistic(2, 1, 0)));
        //System.out.println(StatisticAccess.getInstance().delete(1));
    }

    private StatisticAccess() {
    }

    private static final StatisticAccess instance = new StatisticAccess();

    public static StatisticAccess getInstance() {
        return instance;
    }

    @Override
    public List<Statistic> all() {
        List<Statistic> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `tna_statistic`;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(StatisticAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public Statistic get(int id) {
        Statistic item = null;
        try {
            String query = "SELECT * FROM `tna_statistic` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                item = new Statistic(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(StatisticAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return item;
    }

    @Override
    public boolean add(Statistic item) {
//        try {
//            String query = "INSERT INTO `tna_statistic` VALUES(?,?,?,?);";
//            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
//            ps.setInt(1, item.getId());
//            ps.setInt(2, item.getuId());
//            ps.setInt(3, item.getLoginRequest());
//            ps.setInt(4, item.getApiRequest());
//            int check = ps.executeUpdate();
//            ps.close();
//            return check > 0;
//        } catch (SQLException ex) {
//            Logger.getLogger(StatisticAccess.class.getName()).log(Level.SEVERE, null, ex);
//        }
        
          try {
            String query = "INSERT INTO `tna_statistic` VALUES(?,?,?,?,?,?,?,?);";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, item.getId());
            ps.setInt(2, item.getuId());
            ps.setInt(3, item.getLoginRequest());
            ps.setInt(4, item.getApiRequest());
            ps.setInt(5, item.getDevice());
            ps.setString(6, item.getLocation());
            ps.setString(7,item.getInfo());
            ps.setString(8,item.getOs());
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(StatisticAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try {
            String query = "DELETE FROM `tna_statistic` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(StatisticAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(Statistic item) {
        try {
            String query = "UPDATE `tna_statistic` SET `login_request`=?, `api_request`=? WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, item.getLoginRequest());
            ps.setInt(2, item.getApiRequest());
            ps.setInt(3, item.getId());
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(StatisticAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<Statistic> search(String atr, String text) {
        List<Statistic> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `tna_statistic` WHERE " + atr + " LIKE '%" + text + "%';";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Statistic(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean increaseLoginRequest(int uId) {
        try {
            String query = "SELECT * FROM `tna_statistic` WHERE `uId`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, uId);
            ResultSet rs = ps.executeQuery();
            boolean check = false;
            while (rs.next()) {
                int amount = rs.getInt(3) + 1;
                Statistic item = new Statistic(rs.getInt(1), rs.getInt(2), amount, rs.getInt(4));
                check = update(item);
                break;
            }
            rs.close();
            ps.close();
            return check;
        } catch (SQLException ex) {
            Logger.getLogger(StatisticAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
       public boolean increaseApiRequest(String apikey) {
        try {
            int uId = UserAccess.getInstance().getUserByApiKey(apikey).getId();
            String query = "SELECT * FROM `tna_statistic` WHERE `uId`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, uId);
            ResultSet rs = ps.executeQuery();
            boolean check = false;
            while (rs.next()) {
                int amount =  rs.getInt(4)+ 1;
                Statistic item = new Statistic(rs.getInt(1), rs.getInt(2), rs.getInt(3),amount );
                check = update(item);
                break;
            }
             rs.close();
            ps.close();
            return check;
        } catch (SQLException ex) {
            Logger.getLogger(StatisticAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
