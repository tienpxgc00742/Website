/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controllers.api;

import app.Manager;
import app.api.APIManager;
import app.converters.XMLConverter;
import com.google.appengine.labs.repackaged.org.json.JSONObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author YoungKaka
 */
public class PlayerController extends HttpServlet {

    public static final String URL_PLAYER = "http://long-victor-105516.appspot.com/players/";
 
    public PlayerController() {
        
    }
    
    public void getPlayers(String league,String type) {
        
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setCharacterEncoding("UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String apikey = request.getParameter("apikey");
        
        String teamId = request.getParameter("teamId");
        String mode = request.getParameter("mode");
         if(apikey != null){
             if(APIManager.getInstance().checkApiKey(apikey)) {
                  handleAPI(teamId, mode, request, response);
             }
          }
    }
     protected void handleAPI(String teamId,String mode,HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          if(!"".equals(teamId) && teamId!= null){
            try{
                JSONObject obj = Manager.readJsonFromUrl(URL_PLAYER + teamId);
                if(mode == null || "".equals(mode) ||"json".equalsIgnoreCase(mode)){
                      response.setContentType("application/json;charset=UTF-8");
                      
                        response.getWriter().print(obj.toString());
                }else if("xml".equalsIgnoreCase(mode)) {
                    handleXml(obj, request, response);
                }
            }catch(Exception e){}
        }
     }
   
   protected void handleXml(JSONObject obj,HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     response.setContentType("text/xml;charset=UTF-8");
        String xml = XMLConverter.formatXml(Manager.readXML(obj));
         response.getWriter().print(xml);
           
   }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
