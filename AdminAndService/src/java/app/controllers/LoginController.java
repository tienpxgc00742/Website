/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controllers;

import app.access.base.DataProcess;
import app.models.Account;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.connections.FaceBookConnection;
import org.connections.GoogleConnection;
import org.connections.IConnection;
import org.connections.LinkedInConnection;
import org.connections.TwitterConnection;

/**
 *
 * @author YoungKaka
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String network = request.getParameter("network");
        if(network != null && !"".equals(network)){
            
            if("google".equals(network)){
                handleData(GoogleConnection.getInstance(), request, response);
           }else if("twitter".equals(network)){
              handleData(TwitterConnection.getInstance(), request, response);
           }else if("linkedin".equals(network)){
                 handleData(LinkedInConnection.getInstance(), request, response);
           }
            else if("facebook".equals(network)){
                 handleData(FaceBookConnection.getInstance(), request, response);
           }
        }
        
        
       
    }

    protected void handleData(IConnection connection,HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           String code = request.getParameter(connection.getCode());
            String json = connection.getJson(code);
            Map<String,String> data = connection.getData(json);
            String name = data.get("name");
            String email = data.get("email");
            String avatar = data.get("avatar");
            request.getSession().setAttribute("account", new Account(name, email, avatar));
            
            response.sendRedirect("home");
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
