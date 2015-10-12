/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import app.access.model.User;

/**
 *
 * @author YoungKaka
 */
public class UserAccess extends AbstractAccess<User> {

    public static void main(String[] args) {
       //System.out.println(UserAccess.getInstance().all().get(0).getEmail());
      // System.out.println(UserAccess.getInstance().get(0).getEmail());
        // System.out.println(UserAccess.getInstance().add(new  User("sasad@yahoo.com", "koko", "sasadsa")));
         // System.out.println(UserAccess.getInstance().delete(1));
        // System.out.println(UserAccess.getInstance().update(new User(1, "ooooo@gmail.com", "kiki", "sada")));
      System.out.println(UserAccess.getInstance().getByEmail("ainvgc00704@gmail.com").getName());
        /// System.out.println(UserAccess.getInstance().search("email","a"));
    }

    private UserAccess() {
    }

    private static final UserAccess instance = new UserAccess();

    public static UserAccess getInstance() {
        return instance;
    }

    @Override
    public List<User> all() {
        List<User> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `tna_user`;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public User get(int id) {
        User user = null;
        try {
            String query = "SELECT * FROM `tna_user` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5));
                break;

            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    @Override
    public boolean add(User item) {
        try {
            String query = "INSERT INTO `tna_user` VALUES(?,?,?,?,?);";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, item.getId());
            ps.setString(2, item.getEmail());
            ps.setString(3, item.getName());
            ps.setString(4, item.getApikey());
            ps.setString(5, item.getRole());
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try {
            String query = "DELETE FROM `tna_user` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(User item) {
        try {
            String query = "UPDATE `tna_user` SET `email`=?, `name`=?,`apikey`=?, `role`=? WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setString(1, item.getEmail());
            ps.setString(2, item.getName());
            ps.setString(3, item.getApikey());
            ps.setString(4,item.getRole());
            ps.setInt(5, item.getId());
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<User> search(String atr, String text) {
        List<User> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `tna_user` WHERE " + atr + " LIKE '%" + text + "%'";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public User getByEmail(String email) {
        User user = null;
        try {
            String query = "SELECT * FROM `tna_user` WHERE `email`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5));
                break;
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public User getUserByApiKey(String key) {
        User user = null;
        try {
            String query = "SELECT * FROM `tna_user` WHERE `apikey`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setString(1, key);
            ResultSet rs = ps.executeQuery();
            boolean check = false;
            while (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5));
                break;
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public boolean checkApiKey(String key) {
        if (getUserByApiKey(key) != null) {
            return true;
        }
        return false;
    }

}
