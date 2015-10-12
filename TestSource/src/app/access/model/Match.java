/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.model;

import com.google.gson.Gson;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author YoungKaka
 */
public class Match implements Serializable{
    private int id;
    private Date date;
    private String title;
    private int homeId;
    private int awayId;
    private int homeGoals;
    private int awayGoals;
    private String homeSquad;
    private String awaySquad;
    private String url;
    private String youtube;
    private String description;
    private int lId;

    public Match(Date date, String title, int homeId, int awayId, int homeGoals, int awayGoals, String homeSquad, String awaySquad, String url, String youtube, String description, int lId) {
        this.date = date;
        this.title = title;
        this.homeId = homeId;
        this.awayId = awayId;
        this.homeGoals = homeGoals;
        this.awayGoals = awayGoals;
        this.homeSquad = homeSquad;
        this.awaySquad = awaySquad;
        this.url = url;
        this.youtube = youtube;
        this.description = description;
        this.lId = lId;
    }
    
    
    public Match(int id, Date date, String title, int homeId, int awayId, int homeGoals, int awayGoals, String homeSquad, String awaySquad, String url, String youtube, String description,int lId) {
        this.id = id;
        this.date = date;
        this.title = title;
        this.homeId = homeId;
        this.awayId = awayId;
        this.homeGoals = homeGoals;
        this.awayGoals = awayGoals;
        this.homeSquad = homeSquad;
        this.awaySquad = awaySquad;
        this.url = url;
        this.youtube = youtube;
        this.description = description;
        this.lId = lId;
    }

    public static String[] getAttributes() {
        return new String[]{"title","homeId","awayId","homeGoals","awayGoals","homeSquad","awaySquad","url","youtube","description"};
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getHomeId() {
        return homeId;
    }

    public void setHomeId(int homeId) {
        this.homeId = homeId;
    }

    public int getAwayId() {
        return awayId;
    }

    public void setAwayId(int awayId) {
        this.awayId = awayId;
    }

    public int getHomeGoals() {
        return homeGoals;
    }

    public void setHomeGoals(int homeGoals) {
        this.homeGoals = homeGoals;
    }

    public int getAwayGoals() {
        return awayGoals;
    }

    public void setAwayGoals(int awayGoals) {
        this.awayGoals = awayGoals;
    }

    public String getHomeSquad() {
        return homeSquad;
    }

    public void setHomeSquad(String homeSquad) {
        this.homeSquad = homeSquad;
    }

    public String getAwaySquad() {
        return awaySquad;
    }

    public void setAwaySquad(String awaySquad) {
        this.awaySquad = awaySquad;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getYoutube() {
        return youtube;
    }

    public void setYoutube(String youtube) {
        this.youtube = youtube;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getlId() {
        return lId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }
    
    
    public String toJson() {
        return new Gson().toJson(this);
    }
}
