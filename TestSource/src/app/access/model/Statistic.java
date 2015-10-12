/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.model;

import java.io.Serializable;

/**
 *
 * @author YoungKaka
 */
public class Statistic implements Serializable{
    private int id;
    private int uId;
    private int loginRequest;
    private int apiRequest;
    private int device;
    private String location;
    private String info;
    private String os;
    
    public Statistic() {
    }

    public Statistic(int id, int uId, int loginRequest, int apiRequest) {
        this.id = id;
        this.uId = uId;
        this.loginRequest = loginRequest;
        this.apiRequest = apiRequest;
        
         if(this.info== null){
            info = "";
        }
    }
     public Statistic(int uId, int loginRequest, int apiRequest) {
        this.uId = uId;
        this.loginRequest = loginRequest;
        this.apiRequest = apiRequest;
        if(this.info== null){
            info = "";
        }
    } 

    public Statistic(int id, int uId, int loginRequest, int apiRequest, int device, String location, String info, String os) {
        this.id = id;
        this.uId = uId;
        this.loginRequest = loginRequest;
        this.apiRequest = apiRequest;
        this.device = device;
        this.location = location;
        this.info = info;
        this.os = os;
    }

    public Statistic(int uId, int loginRequest, int apiRequest, int device, String location, String info, String os) {
        this.uId = uId;
        this.loginRequest = loginRequest;
        this.apiRequest = apiRequest;
        this.device = device;
        this.location = location;
        this.info = info;
        this.os = os;
    }

  

   
  
    
  
    
      public static String[] getAttributes() {
        return new String[]{"loginRequest","apiRequest"};
    }
     

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getLoginRequest() {
        return loginRequest;
    }

    public void setLoginRequest(int loginRequest) {
        this.loginRequest = loginRequest;
    }

    public int getApiRequest() {
        return apiRequest;
    }

    public void setApiRequest(int apiRequest) {
        this.apiRequest = apiRequest;
    }

    public int getDevice() {
        return device;
    }

    public void setDevice(int device) {
        this.device = device;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getOs() {
        return os;
    }

    public void setOs(String os) {
        this.os = os;
    }
    
    
    
    
    
}
