/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import app.access.model.League;
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
public class LeagueAccess extends AbstractAccess<League>{

    public static void main(String[] args) {
        System.out.println(LeagueAccess.getInstance().all().size());
    }
       private LeagueAccess() {
    }
    private static final LeagueAccess instance = new LeagueAccess();

    public static LeagueAccess getInstance() {
        return instance;
    }

    @Override
    public List<League> all() {
        List<League> list = new ArrayList<>();
        try {
            String query  = "SELECT * FROM `tna_league`;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new League(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    @Override
    public League get(int id) {
        League league = null;
        try {
            String query  = "SELECT * FROM `tna_league` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                league = new League(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(TeamAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return league;
    }

    @Override
    public boolean add(League item) {
       return false;
    }

    @Override
    public boolean delete(int id) {
       return false;
    }

    @Override
    public boolean update(League item) {
       return false;
    }

    @Override
    public List<League> search(String atr, String text) {
      return null;
    }
    
}
