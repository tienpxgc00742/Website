/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.manager;

import app.access.base.MatchAccess;
import app.access.loader.MatchLoader;
import app.access.model.Match;
import java.util.List;

/**
 *
 * @author YoungKaka
 */
public class MatchManager extends AbstractManager<Match>{

    private final MatchAccess access = MatchAccess.getInstance();
    
    @Override
    public List<Match> getAll() {
    return access.all();
    }

    @Override
    public Match get(int id) {
        return access.get(id);
    }

    @Override
    public boolean delete(int id) {
        return access.delete(id);
    }

    @Override
    public boolean update(Match item) {
        return access.update(item);
    }

    @Override
    public List<Match> search(String atr, String text) {
        return access.search(atr, text);
    }

    @Override
    public void loadNews() {
      MatchLoader.getInstance().loadAllMatches();
    }
    
    
    public List<Match> getByLeague(int id){
        return access.getMatchesByLeague(id);
    }
}
