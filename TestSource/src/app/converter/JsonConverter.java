/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.converter;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author YoungKaka
 */
public class JsonConverter {
    
    public static void main(String[] args) {
        int a = 11;
        int b = 10;
        int c = a - ((a/b) *b);
        System.out.println(c);
    }
      
    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }
    
     public static String readJsonStringFromUrl(String url) {
        String json = "";
        try {
            InputStream is = new URL(url).openStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            json = readAll(rd);
            is.close();
            return json;
        } catch (IOException ex) {
            Logger.getLogger(JsonConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }
    
    public static JSONObject readJsonFromUrl(String url) {
      JSONObject json =  stringToJson(readJsonStringFromUrl(url));
        return json;
    }
    
    public static JSONObject stringToJson(String s){
        try {
            JSONObject json = new JSONObject(s);
            return json;
        } catch (JSONException ex) {
            Logger.getLogger(JsonConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static String objectToJson(Object obj){
        String json = "";
        json = new Gson().toJson(obj);
        return json;
    }
}
