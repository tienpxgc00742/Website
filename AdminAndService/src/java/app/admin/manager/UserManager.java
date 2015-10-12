/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.manager;

import app.access.base.UserAccess;
import app.access.model.User;

import java.util.List;

/**
 *
 * @author YoungKaka
 */
public class UserManager extends AbstractManager<User>{
    
    public static void main(String[] args) {
        UserManager um = new UserManager();
        System.out.println(um.getAll().size());
    }
    
    private final UserAccess access = UserAccess.getInstance();
    

    @Override
    public List<User> getAll() {
        return access.all();
    }
    @Override
    public User get(int id){
        return access.get(id);
    }
    @Override
   public boolean delete(int id){
       return access.delete(id);
   }
   @Override
   public boolean update(User user){
       return access.update(user);
   }
   @Override
   public List<User> search(String atr, String text){
       return access.search(atr, text);
   }
   
     @Override
    public void loadNews() {
      
    }
    
}
