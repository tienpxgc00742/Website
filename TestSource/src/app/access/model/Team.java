/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.model;

import app.converter.JsonConverter;
import com.google.gson.Gson;
import java.io.Serializable;

/**
 *
 * @author YoungKaka
 */
public class Team implements Serializable{
   
    public static final String DATA_URL = "http://long-victor-105516.appspot.com/club/";
    private int id;
    private String name;
    private int leagueId;

    public Team(int id, String name, int leagueId) {
        this.id = id;
        this.name = name;
        this.leagueId = leagueId;
    }
    
 

     public static String[] getAttributes() {
        return new String[]{"name"};
    }
     
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLeagueId() {
        return leagueId;
    }

    public void setLeagueId(int leagueId) {
        this.leagueId = leagueId;
    }
    
    
    
    public String getImageUrl() {
        String url = "";
        try {
            url = JsonConverter.readJsonFromUrl(DATA_URL + id).getString("image");
        } catch (Exception e) {
        }
        return url;
    }
    
     public String toJson() {
        return new Gson().toJson(this);
    }
}
