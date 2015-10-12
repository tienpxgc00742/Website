/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 *
 * @author dfChicken
 */
public class MatchMerge {

    private static final String _background = "http://www.rgbstock.com/cache1scejq/users/g/ge/gesinek/300/nsNgQ8A.jpg";

//lấy css đưa vào <head>
    public static String getMergeCSS() {
        String css = "<style>\n"
                + "	.match-video-thumb{\n"
                + "		width:100%; \n"
                + "		border:#333 solid 0px;\n"
                + "		background-repeat:no-repeat;\n"
                + "		background-size: cover;\n"
                + "		display:block;\n"
                + "	}\n"
                + "	.match-video-thumb table.match-merge{\n"
                + "		width:inherit; \n"
                + "		height:inherit; \n"
                + "		overflow:hidden;\n"
                + "		background-image:url(http://s19.postimg.org/gaz117rmb/versus2.png);\n"
                + "		background-position: 50% 50%;\n"
                + "		background-repeat:no-repeat;\n"
                + "		background-size: 25%;\n"
                + "	}\n"
                + "	.match-merge tr td{\n"
                + "		background-color:transparent;\n"
                + "		width:50%;\n"
                + "	}\n"
                + "	.match-merge tr td img.team-logo-left{\n"
                + "		margin-bottom: 20%;\n"
                + "		margin-top: 20%;\n"
                + "		width:60%; \n"
                + "		margin-left: 5%; \n"
                + "		height:110px; \n"
                + "		float:left; \n"
                + "		display: block;\n"
                + "	}\n"
                + "	.match-merge tr td img.team-logo-right{\n"
                + "		margin-bottom: 20%;\n"
                + "		margin-top: 20%;\n"
                + "		width:60%; \n"
                + "		margin-right: 5%; \n"
                + "		height:110px; \n"
                + "		float:right;\n"
                + "		display: block;\n"
                + "	}\n"
                + "</style>";
        return css;
    }
//lấy html code

    public static String getMergeHTML(String leftImg, String rightImg, String bg) {
        if (bg == null) {
            bg = _background;
        }
        String html = "<div class=\"match-video-thumb\" style=\"background-image:url("+bg+");\">\n"
                + "<table class=\"match-merge\">\n"
                + "  <tr>\n"
                + "    <td><img class=\"team-logo-left\" src=\"" + leftImg + "\"></td>\n"
                + "    <td><img class=\"team-logo-right\" src=\"" + rightImg + "\"></td>\n"
                + "  </tr>\n"
                + "</table>\n"
                + "</div>";
        return html;
    }

    public class BackgroundMerge {

        //vcc1

        public final Map<String, String> bg_map = new HashMap<>();
        //vcc2
        private List<String> bg_key_map;

        //thêm background id + link

        public void setBackgroundImage(String id, String bgLink) {
            this.bg_map.put(id, bgLink);
        }

        //lấy bằng id

        public String getBackgroundImage(String id) {
            return bg_map.get(id);
        }

        //lấy random

        public String getBackgroundImage() {
            Random random = new Random();
            bg_key_map = new ArrayList<>(bg_map.keySet());
            return bg_map.get(bg_key_map.get(random.nextInt(bg_key_map.size())));
        }

        //cc

        public BackgroundMerge() {
            this.bg_map.put("1", "../images/bg1.jpg");
            this.bg_map.put("2", "../images/bg2.jpg");
            this.bg_map.put("3", "../images/bg3.jpg");
            this.bg_map.put("4", "../images/bg4.jpg");
            this.bg_map.put("5", "../images/bg5.jpg");
            this.bg_map.put("6", "../images/bg6.jpg");
            this.bg_map.put("7", "../images/bg7.jpg");
            this.bg_map.put("8", "../images/bg8.jpg");
            this.bg_map.put("9", "../images/bg9.jpg");
            this.bg_map.put("10", "../images/bg10.jpg");
            this.bg_map.put("11", "../images/bg11.jpg");
            this.bg_map.put("12", "../images/bg12.jpg");
            this.bg_map.put("13", "../images/bg13.jpg");
            this.bg_map.put("14", "../images/bg14.jpg");
            this.bg_map.put("15", "../images/bg15.jpg");
        }
        //khởi tạo biến:
        //MatchMerge.BackgroundMerge bg = new MatchMerge().new BackgroundMerge();
        //lấy ngẫu nhiên
        //getMergeCSS(bg.getBackgroundImage());
    }
}
