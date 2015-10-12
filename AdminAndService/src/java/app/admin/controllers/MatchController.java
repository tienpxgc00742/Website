/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.controllers;

import app.access.model.Match;
import app.admin.manager.MatchManager;
import app.converter.DateConverter;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author YoungKaka
 */
public class MatchController extends HttpServlet {

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

        String action = request.getParameter("action");
        if (action != null) {

            if ("del".equals(action)) {
                delete(request, response);
                 response.sendRedirect("matches");
            } else if ("load".equals(action)) {
                loadNews(request, response);
                request.getRequestDispatcher("match/matches.jsp").forward(request, response);
            }
            
        }else {
            request.getRequestDispatcher("match/matches.jsp").forward(request, response);
        }

    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MatchManager manager = getManager(request);
        String id = request.getParameter("id");
        if (id != null) {
            if(manager.delete(Integer.parseInt(id))) {
                 response.sendRedirect("matches");
            }
        }

    }

    protected MatchManager getManager(HttpServletRequest request)
            throws ServletException, IOException {
        return (MatchManager) request.getSession().getAttribute("matchManager");
    }

    protected void loadNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MatchManager manager = getManager(request);
        manager.loadNews();
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

        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            edit(request, response);
        } else if ("search".equals(action)) {
            search(request, response);
        }
    }

    protected void edit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MatchManager manager = getManager(request);

        int id = Integer.parseInt(request.getParameter("id"));
        String date = request.getParameter("date");
        String title = request.getParameter("title");
        int homeId = Integer.parseInt(request.getParameter("homeId"));
        int awayId = Integer.parseInt(request.getParameter("awayId"));
        int homeGoals = Integer.parseInt(request.getParameter("homeGoals"));
        int awayGoals = Integer.parseInt(request.getParameter("homeGoals"));
        String homeSquad = request.getParameter("homeSquad");
        String awaySquad = request.getParameter("awaySquad");
        String url = request.getParameter("url");
        String youtube = request.getParameter("youtube");
        String description = request.getParameter("description");
        int lId = Integer.parseInt(request.getParameter("lId"));

        manager.update(new Match(id, DateConverter.stringToDate(date), title, homeId, awayId, homeGoals, awayGoals, homeSquad, awaySquad, url, youtube, description, lId));

        response.sendRedirect("matches");
    }

    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MatchManager manager = getManager(request);

        String text = request.getParameter("searchText");
        String atr = request.getParameter("atr");
        List<Match> matches = manager.search(atr, text);
        request.setAttribute("matches", matches);
        request.getRequestDispatcher("match/matches.jsp").forward(request, response);

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
