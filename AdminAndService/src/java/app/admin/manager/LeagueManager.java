/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.manager;

import app.access.base.LeagueAccess;
import app.access.model.League;
import java.util.List;

/**
 *
 * @author YoungKaka
 */
public class LeagueManager extends AbstractManager<League> {

    private final LeagueAccess access = LeagueAccess.getInstance();

    @Override
    public List<League> getAll() {
        return access.all();
    }

    @Override
    public League get(int id) {
        return access.get(id);
    }

    @Override
    public boolean delete(int id) {
        return access.delete(id);
    }

    @Override
    public boolean update(League item) {
        return access.update(item);
    }

    @Override
    public List<League> search(String atr, String text) {
        return access.search(atr, text);
    }

    @Override
    public void loadNews() {

    }
}
