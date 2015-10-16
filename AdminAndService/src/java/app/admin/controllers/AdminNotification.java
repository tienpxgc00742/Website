/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.controllers;

import app.access.model.League;
import app.access.model.Match;
import app.admin.manager.LeagueManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author YoungKaka
 */
public class AdminNotification extends HttpServlet {

    public static void main(String[] args) throws ParseException {
//        String s = "14 October 2015 10:10";
//        SimpleDateFormat format = new SimpleDateFormat("dd MMMM yyyy hh:mm");
//        Date date = format.parse(s);
//
//        format = new SimpleDateFormat("yyyy-MM-ddd'T'hh:mm:ss");
//        System.out.println(format.format(date));
       SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
    isoFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
       Calendar calendar = Calendar.getInstance(); 
calendar.add(Calendar.SECOND, 5);
System.out.println(calendar.getTime().getTime());
System.out.println(isoFormat.format(calendar.getTime()));

    }

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
       // response.setContentType("text/html;charset=UTF-8");

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
        request.getRequestDispatcher("notification/push.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   private LeagueManager lm = new LeagueManager();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
       
        String action = request.getParameter("action");
        if ("league".equals(action)) {
            handleLeagueId(request, response);
        } 
        else if ("formatDate".equals(action)) {
            formatDate(request, response);
        }else if("allLeague".equals(action)){
             String line = "";
              
            for (League l : lm.getAll()) {
                line += "<option value=\"" + l.getId() + "\">" + l.getName() + "</option>";
            }
            response.getWriter().print(line);
        }

    }

    protected void handleLeagueId(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        PrintWriter rWriter = response.getWriter();
        int mid = Integer.parseInt(id);
        List<Match> list = MatchController.getManager(request).getByLeague(mid);
        String res = "";
        for (Match m : list) {
            String line = "<option value=\"" + m.getTitle() + "\" data-id=\"" + m.getId() + "\">" + m.getTitle() + "</option>";
            res += line + "\n";
        }
        rWriter.print(res);
    }

    protected void formatDate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter rWriter = response.getWriter();
        String sdate = request.getParameter("sdate");
        SimpleDateFormat format = new SimpleDateFormat("dd MMMM yyyy HH:mm");
        Date date = new Date();
        try {
                date = format.parse(sdate);
            format = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
            String res = format.format(date);
            rWriter.print(res);
        } catch (ParseException ex) {
            Logger.getLogger(AdminNotification.class.getName()).log(Level.SEVERE, null, ex);
        }

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
