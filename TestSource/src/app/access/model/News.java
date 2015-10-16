/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author YoungKaka
 */
public class News implements Serializable{
    private int id;
    private String title;
    private String pubDate;
    private String description;
    private String summaryImg;
    private String content;
    private int hasVideo;

    public News(int id, String title, String pubDate, String description, String summaryImg, String content, int hasVideo) {
        this.id = id;
        this.title = title;
        this.pubDate = pubDate;
        this.description = description;
        this.summaryImg = summaryImg;
        this.content = content;
        this.hasVideo = hasVideo;
    }

    public News(String title, String pubDate, String description, String summaryImg, String content, int hasVideo) {
        this.title = title;
        this.pubDate = pubDate;
        this.description = description;
        this.summaryImg = summaryImg;
        this.content = content;
        this.hasVideo = hasVideo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPubDate() {
        return pubDate;
    }

    public void setPubDate(String pubDate) {
        this.pubDate = pubDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSummaryImg() {
        return summaryImg;
    }

    public void setSummaryImg(String summaryImg) {
        this.summaryImg = summaryImg;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getHasVideo() {
        return hasVideo;
    }

    public void setHasVideo(int hasVideo) {
        this.hasVideo = hasVideo;
    }
    
    
    
}
