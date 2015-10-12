/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.access.base;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author YoungKaka
 */
public class PlayerAccess implements Serializable {

    private static final PlayerAccess instance = new PlayerAccess();

    private PlayerAccess() {
    }

    public static PlayerAccess getInstance() {
        return instance;
    }

    private final static String imagePath = "package";
    private String htmlPlayer = "<tr>\n"
            + "    <td class=\"p-name\">\n"
            + "        <a href=\"\">%s</a>\n"
            + "        <br>\n"
            + "            <small>ID: %s</small>\n"
            + "        </td>\n"
            + "        <td class=\"p-team\">\n"
            + "            <a href=\"#\">\n"
            + "                <img alt=\"image\" title=\"image\" onerror=\"this.src='./package/default.jpg'\" class=\"\" src=\"%s\">\n"
            + "                </a>\n"
            + "            <a href=\"%s\">\n"
            + "                <img alt=\"image\" title=\"%s\" class=\"\" src=\"%s\">\n"
            + "                </a>\n"
            + "                    </td>\n"
            + "                    <td class=\"p-progress\">\n"
            + "                        <div class=\"progress progress-xs\">\n"
            + "                            <div style=\"width: 87%%\" class=\"progress-bar progress-bar-success\"></div>\n"
            + "                        </div>\n"
            + "                        <small>87 Complete </small>\n"
            + "                    </td>\n"
            + "                    <td>\n"
            + "                        <span class=\"label label-primary\">Active</span>\n"
            + "                    </td>\n"
            + "                    <td>\n"
            + "                        <a href=\"project_details.html\" class=\"btn btn-primary btn-xs\">\n"
            + "                            <i class=\"fa fa-folder\"></i> View \n"
            + "                    \n"
            + "                        </a>\n"
            + "                        <a href=\"#\" class=\"btn btn-info btn-xs\">\n"
            + "                            <i class=\"fa fa-pencil\"></i> Edit \n"
            + "                    \n"
            + "                        </a>\n"
            + "                        <a href=\"#\" class=\"btn btn-danger btn-xs\">\n"
            + "                            <i class=\"fa fa-trash-o\"></i> Delete \n"
            + "                    \n"
            + "                        </a>\n"
            + "                    </td>\n"
            + "                </tr>";

    /**
     * Nhập số trang hiển thị và row bắt đầu
     *
     * @return String html
     */
    public String getAllPlayers(int page, int number) {
        String response = "";
        String query = "select * from tna_player LIMIT %d,%d";
        try {
            Statement st = (Statement) DataProcess.getConnection().createStatement();
            ResultSet rs = st.executeQuery(String.format(query, page, number));
            while (rs.next()) {
                //1: name 2:ID 3:
                response += String.format(htmlPlayer, rs.getString(4), rs.getString(1), "./" + imagePath + "/player/" + rs.getString(1) + ".png", "", "", "./" + imagePath + "/club/" + rs.getString(2) + ".png");
            }
            rs.close();
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return response;
    }

    public String getTotalPlayer() {
        String query = "SELECT COUNT(*) FROM tna_player";
        try {
            Statement st = (Statement) DataProcess.getConnection().createStatement();
            ResultSet rs = st.executeQuery(String.format(query));
            while (rs.next()) {
                return rs.getString(1);
            }
            rs.close();
            st.close();
        } catch (SQLException ex) {
            Logger.getLogger(DataProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
