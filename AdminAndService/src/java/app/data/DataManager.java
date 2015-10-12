/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.data;

import app.Manager;
import static app.controllers.api.MatchController.URL_MATCH;
import app.models.Match;
import app.models.MatchRoot;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.google.appengine.repackaged.com.google.gson.Gson;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author YoungKaka
 */
public class DataManager implements Serializable{
    
    public static void main(String[] args) {
        DataManager dm = DataManager.getInstance();
        System.out.println(dm.getPremierMatches().getMatches().get(0).getYoutube());
    }

    private static final DataManager instance = new DataManager();

    public static DataManager getInstance() {
        return instance;
    }

    private DataManager() {
    }

    private MatchRoot premierMatches;
    private MatchRoot laligaMatches;
    private MatchRoot bundesligaMatches;
    private MatchRoot seriaMatches;
    private MatchRoot ligoneMatches;
    private MatchRoot uefaMatches;
    
    private List<Match> promentMatches;
      private List<Match> latestMatches;
      
    public MatchRoot getPremierMatches() {
        if(premierMatches == null){
            premierMatches = getMatchData("premier");
        }
        return premierMatches;
    }

    public MatchRoot getLaligaMatches() {
          if(laligaMatches == null){
            laligaMatches = getMatchData("laliga");
        }
        return laligaMatches;
    }

    public MatchRoot getBundesligaMatches() {
          if(bundesligaMatches == null){
            bundesligaMatches = getMatchData("bundesliga");
        }
        return bundesligaMatches;
    }

    public MatchRoot getSeriaMatches() {
          if(seriaMatches == null){
            seriaMatches = getMatchData("seria");
        }
        return seriaMatches;
    }

    public MatchRoot getLigoneMatches() {
          if(ligoneMatches == null){
            ligoneMatches = getMatchData("ligone");
        }
        return ligoneMatches;
    }

    public MatchRoot getUefaMatches() {
          if(uefaMatches == null){
            uefaMatches = getMatchData("uefa");
        }
        return uefaMatches;
    }

    public List<Match> getLatestMatches() {
          if(latestMatches == null) {
          latestMatches =  getLatests();
        }
        return latestMatches;
    }

       private List<Match> getLatests() {
         List<Match> list = new ArrayList<>();
        list.add(getPremierMatches().getMatches().get(0));
        list.add(getPremierMatches().getMatches().get(1));
        list.add(getPremierMatches().getMatches().get(2));
         list.add(getPremierMatches().getMatches().get(3));
        list.add(getBundesligaMatches().getMatches().get(0));
        list.add(getLaligaMatches().getMatches().get(0));
        list.add(getSeriaMatches().getMatches().get(0));
        list.add(getLigoneMatches().getMatches().get(0));
        return list;
       }
    
    
    public List<Match> getPromentMatches() {
        if(promentMatches == null) {
          promentMatches =  getProments();
        }
        return promentMatches;
    }
    
    private List<Match> getProments() {
        List<Match> list = new ArrayList<>();
        list.add(getPremierMatches().getMatches().get(5));
        list.add(getPremierMatches().getMatches().get(6));
        list.add(getPremierMatches().getMatches().get(4));
         list.add(getPremierMatches().getMatches().get(5));
        list.add(getBundesligaMatches().getMatches().get(3));
        list.add(getLaligaMatches().getMatches().get(3));
        list.add(getSeriaMatches().getMatches().get(3));
        list.add(getLigoneMatches().getMatches().get(3));
        return list;
    }
   
    
    private MatchRoot getMatchData(String league){
        MatchRoot root = null;
         JSONObject obj = Manager.readJsonFromUrl(URL_MATCH + league);
         String json = obj.toString();
         Gson gson = new Gson();
         root = gson.fromJson(json, MatchRoot.class);
         return root;
    }

 
    
}
