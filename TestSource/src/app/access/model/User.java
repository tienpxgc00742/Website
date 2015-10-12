/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.model;

import com.google.gson.Gson;
import java.io.Serializable;

/**
 *
 * @author YoungKaka
 */
public class User implements Serializable{
    private int id;
    private String email;
    private String name;
    private String apikey;
    private String role;
    
    public User() {
    }

    public User(String email, String name, String apikey, String role) {
        this.email = email;
        this.name = name;
        this.apikey = apikey;
         this.role = role;
    }

    public User(int id, String email, String name, String apikey, String role) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.apikey = apikey;
        this.role = role;
    }

    
   

    public static String[] getAttributes() {
        return new String[]{"email","name","apikey"};
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getApikey() {
        return apikey;
    }

    public void setApikey(String apikey) {
        this.apikey = apikey;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
     public String toJson() {
        return new Gson().toJson(this);
    }
     
}
