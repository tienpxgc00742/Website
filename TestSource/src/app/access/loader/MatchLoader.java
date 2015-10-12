/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.loader;

import app.access.base.MatchAccess;
import app.access.base.TeamAccess;
import app.access.model.Match;
import app.access.model.Team;
import app.converter.DateConverter;
import app.converter.JsonConverter;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author YoungKaka
 */
public class MatchLoader {

    public static void main(String[] args) {
        MatchLoader ml = MatchLoader.getInstance();
        boolean check = ml.deleteALl();
        System.out.println(check);
        if(check) {
            ml.loadAllMatches();
        }
       
    }

    public static final String MATCH_PREMIER_URL = "http://long-victor-105516.appspot.com/matches/premier";
    public static final String MATCH_BUNDESLIGA_URL = "http://long-victor-105516.appspot.com/matches/bundesliga";
    public static final String MATCH_LALIGA_URL = "http://long-victor-105516.appspot.com/matches/laliga";
    public static final String MATCH_SERIEA_URL = "http://long-victor-105516.appspot.com/matches/seria";
    public static final String MATCH_LIGONE_URL = "http://long-victor-105516.appspot.com/matches/ligone";
    public static final String MATCH_CHAMPIONS_URL = "http://long-victor-105516.appspot.com/matches/uefa";

     private static final MatchLoader instance = new MatchLoader();
    
    public static MatchLoader getInstance() {
        return instance;
    }

    private MatchLoader() {
    }
    
    public boolean deleteALl() {
        return MatchAccess.getInstance().deleteAll();
    }
    
    
    public boolean loadAllMatches() {
        for (int i = 0; i < 6; i++) {
            MyThread myThread = new MyThread(i);
            myThread.start();
        }
        return true;
    }

    public boolean loadPremierMatches() {
        return loadMatch(MATCH_PREMIER_URL, 11);
    }

    public boolean loadBundesligaMatches() {
        return loadMatch(MATCH_BUNDESLIGA_URL, 22);
    }

    public boolean loadLaligaMatches() {
        return loadMatch(MATCH_LALIGA_URL, 67);
    }

    public boolean loadLigoneMatches() {
        return loadMatch(MATCH_LIGONE_URL, 16);
    }

    public boolean loadSeriaMatches() {
        return loadMatch(MATCH_SERIEA_URL, 32);
    }

    public boolean loadChampionsMatches() {
        return loadMatch(MATCH_CHAMPIONS_URL, 5);
    }

   
    
    private int getTeamId(String name){
        for(Team team : TeamAccess.getInstance().all()){
             if(name.contains(team.getName())){
                 return team.getId();
             }
        }
        return 2201;
    }
    private boolean loadMatch(String matchUrl, int leagueId) {
        try {
            JSONObject root = JsonConverter.readJsonFromUrl(matchUrl);
            System.out.println(root);
            int count = (int) root.get("count");
            JSONArray list = root.getJSONArray("matches");
            for (int i = 0; i < list.length(); i++) {
                JSONObject match = list.getJSONObject(i);
                String date = match.getString("date");
                int homeId = match.getInt("homeId");
                String homeName = match.getString("homeTeamName");
                int awayId = match.getInt("awayId");
                String awayName = match.getString("awayTeamName");
                
                homeId = getTeamId(homeName);
                awayId = getTeamId(awayName);
                JSONObject result = match.getJSONObject("result");
                int homeGoals = result.getInt("goalsHomeTeam");
                int awayGoals = result.getInt("goalsAwayTeam");
                String url = match.getString("url");
                String youtube = match.getString("youtube");
                String description = match.getString("description");
                String image = match.getString("image");

                Match m = new Match(DateConverter.stringToDate(date, "UTC + 7"), homeName + " vs " + awayName, homeId, awayId, homeGoals, awayGoals, "", "", url, youtube, description, leagueId);
                if (!MatchAccess.getInstance().add(m)) {
                    if (!MatchAccess.getInstance().update(m)) {
                        return false;
                    }
                }

            }
        } catch (JSONException ex) {
            Logger.getLogger(MatchLoader.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    private class MyThread extends Thread {

        private int index;

        public MyThread(int index) {
            this.index = index;
        }

        @Override
        public void run() {
            if (index == 0) {
                loadPremierMatches();
            } else if (index == 1) {
                loadBundesligaMatches();
            } else if (index == 2) {
                loadLaligaMatches();
            } else if (index == 3) {
                loadLigoneMatches();
            } else if (index == 4) {
                loadSeriaMatches();
            } 
//            else if (index == 5) {
//                loadChampionsMatches();
//            }
        }

    }
}
