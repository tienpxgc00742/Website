/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import app.access.model.Team;
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
public class TeamAccess extends AbstractAccess<Team>{

    public static void main(String[] args) {
        System.out.println(TeamAccess.getInstance().search("name","a"));
    }
    
    private TeamAccess(){}
    
    private static final TeamAccess instance = new TeamAccess();
    public static TeamAccess getInstance() {
        return instance;
    }
    
    @Override
    public List<Team> all() {
        List<Team> list = new ArrayList<>();
        try {
            String query  = "SELECT * FROM `tna_club`;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Team(rs.getInt(1),rs.getString(2),rs.getInt(3)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public Team get(int id) {
        Team team = null;
         try {
            String query  = "SELECT * FROM `tna_club` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
               team = new Team(rs.getInt(1),rs.getString(2),rs.getInt(3));
               break;
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
         return team;
    }

    @Override
    public boolean add(Team item) {
        try {
            String query = "INSERT INTO `tna_club` VALUES(?,?,?);";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, item.getId());
            ps.setString(2, item.getName());
            ps.setInt(3, item.getLeagueId());
            int check  = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try {
            String query = "DELETE FROM `tna_club` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
              ps.setInt(1, id);
            int check  = ps.executeUpdate();
             ps.close();
             return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(Team item) {
        try {
            String query = "UPDATE `tna_club` SET `name`=?, `league_id`=? WHERE `id`=?;";
            PreparedStatement ps  = DataProcess.getConnection().prepareStatement(query);
            ps.setString(1, item.getName());
            ps.setInt(2,item.getLeagueId());
              ps.setInt(3,item.getId());
             int check  = ps.executeUpdate();
             ps.close();
             return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<Team> search(String atr, String text) {
         List<Team> list = new ArrayList<>();
        try {
            String query =  "SELECT * FROM `tna_club` WHERE " + atr + " LIKE '%" + text + "%';";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
             ResultSet rs = ps.executeQuery();
            while(rs.next()){
               list.add(new Team(rs.getInt(1),rs.getString(2),rs.getInt(3)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}
