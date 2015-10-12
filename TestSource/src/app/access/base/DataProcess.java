/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import com.google.appengine.api.utils.SystemProperty;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NguyenVanAi
 */
public class DataProcess {

    public static void main(String[] args) {
        System.out.println(DataProcess.getConnection());
    }

    private static final DataProcess dataProcess = new DataProcess();
    private static Connection connection;

    private DataProcess() {
    }

    public static DataProcess getInstance() {
        return dataProcess;
    }
    
    
    

    private static Connection getAppengineConnect() {
        Connection conn = null;
        String url = "";

        try {
            if (SystemProperty.environment.value()
                    == SystemProperty.Environment.Value.Production) {
                // Load the class that provides the new "jdbc:google:mysql://" prefix.
                Class.forName("com.mysql.jdbc.GoogleDriver");
                url = "jdbc:google:mysql://windy-territory-109203:tnamaindb/test?user=root";
                System.out.println("Clouddddddddddd");
            } else {
                // Local MySQL instance to use during development.
                Class.forName("com.mysql.jdbc.Driver");
                url = "jdbc:mysql://173.194.105.51:3306/test?user=admin&password=admin";
                System.out.println("Localllllllllllllll");
                // Alternatively, connect to a Google Cloud SQL instance using:
                // jdbc:mysql://ip-address-of-google-cloud-sql-instance:3306/guestbook?user=root
            }
            conn = DriverManager.getConnection(url);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

//    private static Connection connect() {
//        Connection con = null;
//
//        String database = "test";
//        String user = "admin";
//        String pass = "admin";
//        String url = "jdbc:mysql://173.194.247.171:3306/" + database;
//
////          String user = "root";
////        String pass = "manchettoh8";
////        String url = "jdbc:mysql://localhost:3306/"+database;
//        try {
//            // Class.forName("com.mysql.jdbc.Driver");
//            Class.forName("com.google.appengine.api.rdbms.AppEngineDriver");
//            con = DriverManager.getConnection(url, user, pass);
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(DataProcess.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return con;
//    }
    public static Connection getConnection() {
        if (connection == null) {
            connection = getAppengineConnect();
            System.out.println("Conectionnnnnnnnnnnnnnn: " + connection);
        }
        return connection;
    }
}
