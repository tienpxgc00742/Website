/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.manager;

import app.access.base.TeamAccess;
import app.access.loader.TeamLoader;
import app.access.model.Team;
import java.util.List;

/**
 *
 * @author YoungKaka
 */
public class TeamManager extends  AbstractManager<Team> {

    private final TeamAccess access = TeamAccess.getInstance();
    
    @Override
    public List<Team> getAll() {
        return access.all();
    }

    @Override
    public Team get(int id) {
        return access.get(id);
    }

    @Override
    public boolean delete(int id) {
        return access.delete(id);
    }

    @Override
    public boolean update(Team item) {
        return access.update(item);
    }

    @Override
    public List<Team> search(String atr, String text) {
        return access.search(atr, text);
    }
      @Override
    public void loadNews() {
      TeamLoader.getInstance().loadAllTeam();
    }
    
}
