/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author YoungKaka
 */
public class DateConverter {
    public static void main(String[] args) {
        System.out.println( stringToDate("2015-09-27T15:00:00Z","UTC + 7"));
    }
    
    public static Date stringToDate(String sd, String timeZoneID){
            SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
            isoFormat.setTimeZone(TimeZone.getTimeZone(timeZoneID));
            Date date = new  Date();
        try {
            date = isoFormat.parse(sd);
        } catch (ParseException ex) {
            Logger.getLogger(DateConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
            return date;
    }
    
    public static Date stringToDate(String sd){
            SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new  Date();
        try {
            date = isoFormat.parse(sd);
        } catch (ParseException ex) {
            Logger.getLogger(DateConverter.class.getName()).log(Level.SEVERE, null, ex);
        }
            return date;
    }
}
