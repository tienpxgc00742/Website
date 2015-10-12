/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.api;

import app.access.base.StatisticAccess;
import app.access.base.UserAccess;
import app.access.model.User;
import java.util.Random;
import java.util.Scanner;

/**
 *
 * @author YoungKaka
 */
public class APIManager {

    public static final String CALLBACK_FACEBOOK = "http://localhost:9090/login?network=facebook";
    public static final String CALLBACK_GOOGLE = "http://localhost:9090/login?network=google";
    public static final String CALLBACK_TWITTER = "http://localhost:9090/login?network=twitter";
    public static final String CALLBACK_LINKEDIN = "http://localhost:9090/login?network=linkedin";

//     public static final String CALLBACK_FACEBOOK = "http://the-geode-736.appspot.com/login?network=facebook";
//    public static final String CALLBACK_GOOGLE = "http://the-geode-736.appspot.com/login?network=google";
//    public static final String CALLBACK_TWITTER = "http://the-geode-736.appspot.com/login?network=twitter";
//    public static final String CALLBACK_LINKEDIN = "http://the-geode-736.appspot.com/login?network=linkedin";
    
//     public static final String CALLBACK_FACEBOOK = "http://windy-territory-109203.appspot.com/login?network=facebook";
//    public static final String CALLBACK_GOOGLE = "http://windy-territory-109203.appspot.com/login?network=google";
//    public static final String CALLBACK_TWITTER = "http://windy-territory-109203.appspot.com/login?network=twitter";
//    public static final String CALLBACK_LINKEDIN = "http://twindy-territory-109203.appspot.com/login?network=linkedin";

    
    public static final String GET_CLUB_URL = "http://long-victor-105516.appspot.com/club/";

//    private static final String TNA_KEY = "tna";
//    private static final String FV_KEY = "fv";
    public static void main(String[] args) {
        System.out.println(APIManager.getInstance().checkApiKey("juda2tdkel8xyi711kqx"));

//            System.out.println(APIManager.getInstance().randomApiKey());
//     Scanner sc = new Scanner(System.in);
//        System.out.print("Key: ");
//          String key  = sc.nextLine();
//        System.out.println(APIManager.getInstance().checkApiKey(key));
    }
    private static final APIManager instance = new APIManager();

    public static APIManager getInstance() {
        return instance;
    }

    private APIManager() {

    }

    public String getApiKey() {
        RandomString randomString = new RandomString(20);
        return randomString.nextString();
    }

//    public String randomApiKey() {
//        Random random = new Random();
//        String key = "";
//        try {
//            RandomString randomString = new RandomString(random.nextInt(8));
//            key = randomString.nextString() + TNA_KEY;
//            randomString = new RandomString(random.nextInt(8));
//             key += randomString.nextString() +FV_KEY;
//             randomString = new RandomString(random.nextInt(8));
//              key +=randomString.nextString();
//        } catch (Exception e) {
//            key = randomApiKey();
//        }
//        return key;
//    }
//    public boolean checkApiKey(String key) {
//       if(key.contains(TNA_KEY) && key.contains(FV_KEY)) {
//           return true;
//       }
//        return false;
//    }
    public boolean checkApiKey(String key) {
        User user = UserAccess.getInstance().getUserByApiKey(key);
        if (user != null) {
            StatisticAccess.getInstance().increaseApiRequest(key);
            return true;
        }
        return false;
    }
}
