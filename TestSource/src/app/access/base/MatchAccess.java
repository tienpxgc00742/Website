/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import app.access.model.Match;
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
public class MatchAccess extends AbstractAccess<Match> {

    public static void main(String[] args) {
        //System.out.println(MatchAccess.getInstance().search("title",""));
        System.out.println(MatchAccess.getInstance().getMatchesByLeague(11).size());
    }
    private MatchAccess() {
    }
    private static final MatchAccess instance = new MatchAccess();

    public static MatchAccess getInstance() {
        return instance;
    }

    @Override
    public List<Match> all() {
        List<Match> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `tna_match`;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SimpleDateFormat sdm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = sdm.parse(rs.getString(2));
                list.add(new Match(rs.getInt(1), date, rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12),rs.getInt(13)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
 public List<Match> getMatchesByLeague(int id ) {
        List<Match> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `tna_match` where `lid`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SimpleDateFormat sdm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = sdm.parse(rs.getString(2));
                list.add(new Match(rs.getInt(1), date, rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12),rs.getInt(13)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    @Override
    public Match get(int id) {
        Match match = null;
        try {
            String query = "SELECT * FROM `tna_match` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SimpleDateFormat sdm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = sdm.parse(rs.getString(2));
                match = new Match(rs.getInt(1), date, rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12),rs.getInt(13));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return match;
    }

    @Override
    public boolean add(Match item) {
        try {
            String query = "INSERT INTO `tna_match` VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            SimpleDateFormat sdm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = sdm.format(item.getDate());
            ps.setInt(1, item.getId());
            ps.setString(2, date);
            ps.setString(3, item.getTitle());
            ps.setInt(4, item.getHomeId());
            ps.setInt(5, item.getAwayId());
            ps.setInt(6, item.getHomeGoals());
            ps.setInt(7, item.getAwayGoals());
            ps.setString(8, item.getHomeSquad());
            ps.setString(9, item.getAwaySquad());
            ps.setString(10, item.getUrl());
            ps.setString(11, item.getYoutube());
            ps.setString(12, item.getDescription());
            ps.setInt(13, item.getlId());
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try {
            String query = "DELETE FROM `tna_match` WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ps.setInt(1, id);
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean update(Match item) {
        try {
            String query = "UPDATE `tna_match` SET `date`=?, `title`=?, `homeId`=?,`awayId`=?,`homeGoals`=?,`awayGoals`=?,`homeSquad`=?,`awaySquad`=?,`url`=?,`youtube`=?,`description`=?, `lId`=? WHERE `id`=?;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            SimpleDateFormat sdm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date = sdm.format(item.getDate());

            ps.setString(1, date);
            ps.setString(2, item.getTitle());
            ps.setInt(3, item.getHomeId());
            ps.setInt(4, item.getAwayId());
            ps.setInt(5, item.getHomeGoals());
            ps.setInt(6, item.getAwayGoals());
            ps.setString(7, item.getHomeSquad());
            ps.setString(8, item.getAwaySquad());
            ps.setString(9, item.getUrl());
            ps.setString(10, item.getYoutube());
            ps.setString(11, item.getDescription());
            ps.setInt(12, item.getlId());
                        ps.setInt(13, item.getId());
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<Match> search(String atr, String text) {

        List<Match> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM `tna_match` WHERE " + atr + " LIKE '%" + text + "%';";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SimpleDateFormat sdm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = sdm.parse(rs.getString(2));
                list.add(new Match(rs.getInt(1), date, rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12),rs.getInt(13)));
            }
            rs.close();
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
  
    public boolean deleteAll() {
        try {
            String query = "DELETE FROM `tna_match`;";
            PreparedStatement ps = DataProcess.getConnection().prepareStatement(query);
            int check = ps.executeUpdate();
            ps.close();
            return check > 0;
        } catch (SQLException ex) {
            Logger.getLogger(MatchAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
