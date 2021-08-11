/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author thoai
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
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
        request.setCharacterEncoding("UTF-8");

        // get data username password to login page
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DAO dao = new DAO();

        // check account exit in database
        boolean checkAccountExist = dao.checkAccountExist(username);
        String userMessage = null;
        String passMessage = null;

        // if account don't exist display message
        if (checkAccountExist == false) {
            userMessage = "Invalid username";
            request.setAttribute("userMessage", userMessage);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            Account account = dao.login(username, password);

            // if wrong pass, dislay mess and enter again
            if (account == null) {
                passMessage = "Wrong password, please enter again";
                request.setAttribute("passMessage", passMessage);
                request.setAttribute("username", username);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                // Set session account
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                session.setMaxInactiveInterval(60 * 60 * 12);// session exits in 12h

                response.sendRedirect("HomeController");
            }
        }
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
