/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.controllers;

import app.access.model.Team;
import app.admin.manager.TeamManager;
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
public class TeamController extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String action = request.getParameter("action");
        if (action != null) {
            if ("del".equals(action)) {
                delete(request, response);
                 response.sendRedirect("teams");
            } else if ("load".equals(action)) {
                loadNews(request, response);
                 request.getRequestDispatcher("team/teams.jsp").forward(request, response);
            }
            
        }else {
            request.getRequestDispatcher("team/teams.jsp").forward(request, response);
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TeamManager manager = getManager(request);
        String id = request.getParameter("id");
        if (id != null) {
            if(manager.delete(Integer.parseInt(id))) {
                 response.sendRedirect("teams");
            }
        }
    }

    private TeamManager getManager(HttpServletRequest request) {
        return (TeamManager) request.getSession().getAttribute("teamManager");
    }

    protected void loadNews(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TeamManager manager = getManager(request);
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
        TeamManager manager = getManager(request);

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int leagueId = Integer.parseInt(request.getParameter("leagueId"));
        manager.update(new Team(id, name,leagueId));
        response.sendRedirect("teams");
    }

    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TeamManager manager = getManager(request);
        String text = request.getParameter("searchText");
        String atr = request.getParameter("atr");
        List<Team> users = manager.search(atr, text);
        request.setAttribute("teams", users);
        request.getRequestDispatcher("team/teams.jsp").forward(request, response);
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
