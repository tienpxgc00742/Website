/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.loader;

import app.access.base.TeamAccess;
import app.access.model.Team;
import app.converter.JsonConverter;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author YoungKaka
 */
public class TeamLoader {

    final String url = Team.DATA_URL;

    public static void main(String[] args) {
        TeamLoader tl = TeamLoader.getInstance();
        System.out.println(tl.loadAllTeam());
    }

    private static final TeamLoader instance = new TeamLoader();
    
    public static TeamLoader getInstance() {
        return instance;
    }

    private TeamLoader() {
        
    }
    
    
    public boolean loadAllTeam() {
        int in = 30;
        MyThread mt = new MyThread(1, in);
        mt.start();
        for (int i = 1; i < 10; i++) {
            int count = i * in;
            MyThread myThread = new MyThread(count, count  +  in);
            myThread.start();
            
        }
        return true;
    }

    private boolean load(int min, int max) {
        for (int i = min; i < max; i++) {
            try {
                JSONObject json = JsonConverter.readJsonFromUrl(url + i);    
                Object name = json.get("name");                        
                if (!name.toString().equals("null")) {
                    Team team = new Team(i,name.toString(),0);
                    if (!TeamAccess.getInstance().add(team)) {
                            if (!TeamAccess.getInstance().update(team)) {
                        return false;
                    }
                    }
                }
            } catch (JSONException ex) {
                Logger.getLogger(TeamLoader.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return true;
    }

    private class MyThread extends Thread {

        private final int min;
        private final int max;

        public MyThread(int min, int max) {
            this.min = min;
            this.max = max;
        }

        @Override
        public void run() {
            load(min, max);
        }

    }
}
