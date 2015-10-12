/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import app.api.APIManager;
import com.google.appengine.labs.repackaged.org.json.JSONException;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.google.appengine.labs.repackaged.org.json.XML;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author YoungKaka
 */
public class Manager {

    public static final String TNA_MAIL = "ainvgc00704@gmail.com";

    public static void main(String[] args) throws IOException, JSONException {
//        JSONObject json = readJsonFromUrl("http://long-victor-105516.appspot.com/players/66");
//        System.out.println(json.toString());
//        String xml = XML.toString(json);
//        System.out.println(xml);

        //System.out.println(getClubImageById("68"));
        String to = "youngoptimalkaka@gmail.com";
        String from = "ainvgc00704@gmail.com";
        String name = "Young Kaka";
        String msg = "hello tna";
        String phone = null;
        if (sendMail(from, to, msg, name, phone)) {
            System.out.println("Successfully !");
        }

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
            Logger.getLogger(Manager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }

    public static JSONObject readJsonFromUrl(String url) {

        JSONObject json = null;
        try {
            json = new JSONObject(readJsonStringFromUrl(url));
        } catch (JSONException ex) {
            Logger.getLogger(Manager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return json;
    }

    public static String readXML(JSONObject json) {
        String xml = "";
        try {
            xml = XML.toString(json);
        } catch (JSONException ex) {
            Logger.getLogger(Manager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "<root>" + xml + "</root>";
    }

    public static String getClubImageById(String cId) {

        String url = "";
        try {
            JSONObject jsono = readJsonFromUrl(APIManager.GET_CLUB_URL + cId);
            url = jsono.getString("image");
        } catch (JSONException ex) {
            Logger.getLogger(Manager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return url;
    }

    public static boolean sendMail(String from, String to, String name, String messag, String phone) {

        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);

        String msgBody = "";
        msgBody += "Name: " + name;

        if (phone != null && !"".equals(phone)) {
            msgBody += "\n Phone Number: " + phone;
        }
        msgBody += "\n Message: " + messag;
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(from, name));
            msg.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to, "Mr. User"));
            msg.setSubject("TNA Supports!");
            msg.setText(msgBody);
            Transport.send(msg);

        } catch (AddressException e) {
            Logger.getLogger(Manager.class.getName()).log(Level.SEVERE, null, e);
        } catch (MessagingException | UnsupportedEncodingException e) {
            Logger.getLogger(Manager.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

}
