/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.admin.controllers;

import app.access.model.User;
import app.admin.manager.UserManager;
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
public class UserController extends HttpServlet {

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
            } else if ("edit".equals(action)) {
                request.getRequestDispatcher("user/editUser.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("user/users.jsp").forward(request, response);
        }

    }

    protected void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserManager manager = getManager(request);
        String id = request.getParameter("id");
        if (id != null) {
            if(manager.delete(Integer.parseInt(id))) {
                 response.sendRedirect("users");
            }
        }
       
    }

    protected UserManager getManager(HttpServletRequest request)
            throws ServletException, IOException {
        return (UserManager) request.getSession().getAttribute("userManager");
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
        UserManager manager = getManager(request);

        int id = Integer.parseInt(request.getParameter("id"));
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String apikey = request.getParameter("apikey");
        String role = request.getParameter("role");
        manager.update(new User(id, email, name, apikey, role));
        response.sendRedirect("users");
    }

    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserManager manager = getManager(request);

        String text = request.getParameter("searchText");
        String atr = request.getParameter("atr");
        List<User> users = manager.search(atr, text);
        request.setAttribute("users", users);
        request.getRequestDispatcher("user/users.jsp").forward(request, response);

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
