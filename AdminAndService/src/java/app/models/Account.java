/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.models;

import app.access.base.StatisticAccess;
import app.access.base.UserAccess;
import app.access.model.Statistic;
import app.access.model.User;
import app.api.APIManager;
import java.io.Serializable;

/**
 *
 * @author YoungKaka
 */
public class Account implements Serializable {

    public static void main(String[] args) {
        UserAccess access = UserAccess.getInstance();
        System.out.println(access.getByEmail("ainvgc00704@gmail.com").getName());
    }
    private String name;
    private String email;
    private String avatar;
    private String apikey;
    private String role;

    public Account(String name, String email, String avatar) {
        this.name = name;
        this.email = email;
        this.avatar = avatar;
        this.role = "user";

        handleAccount(this.email, this.name, this.apikey, this.role);
    }

    private void handleAccount(String email, String name, String apikey, String role) {
        if (email != null) {
            UserAccess access = UserAccess.getInstance();
            User user = access.getByEmail(email);
            if (user == null) {
                apikey = APIManager.getInstance().getApiKey();
                if (access.add(new User(email, name, apikey, role))) {
                    if ((user = access.getByEmail(email)) != null) {
                        StatisticAccess.getInstance().add(new Statistic(user.getId(), 1, 0));
                    }
                }
            } else {
                this.apikey = user.getApikey();
                this.role = user.getRole();
                user.setName(name);
                access.update(user);
                if (!StatisticAccess.getInstance().increaseLoginRequest(user.getId())) {
                    StatisticAccess.getInstance().add(new Statistic(user.getId(), 0, 1));
                }
            }
        }
    }

    public Account(String name, String email, String avatar, String apikey) {
        this.name = name;
        this.email = email;
        this.avatar = avatar;
        this.apikey = apikey;
    }

    public String getApikey() {
        return apikey;
    }

    public void setApikey(String apikey) {
        this.apikey = apikey;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
