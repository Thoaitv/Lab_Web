/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import entity.Department;
import entity.Request;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thoai
 */
@WebServlet(name = "ViewController", urlPatterns = {"/ViewController"})
public class ViewController extends HttpServlet {

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

        //get data on web page
// Get list Request Department with DepartId and title
        String dataCreated = request.getParameter("date");
        String departmentID = request.getParameter("departmentID");
        String last1day = request.getParameter("last1day");
        String last2day = request.getParameter("last2day");

        DAO dao = new DAO();
        List<Request> listRequest = null;
        String title = "";
        // Get dât
        title = request.getParameter("requestTitle");
        
        
        // If last 1 & 2 day not null -> display Detail Request ast 1 2
        //Get list request of 2 case: last 2 day, current day
        if (last1day != null && last2day != null) { // Lấy ra list Request
            listRequest = dao.getRequest2LastDay(departmentID, last1day, last2day);
        } else {
            // If search title
            if (dataCreated == "") {
                listRequest = dao.getRequestDepartment(departmentID, title);
                dataCreated = null;
                // If search Both Title and Date
            } else {
                listRequest = dao.getRequestDepartment(departmentID, title, dataCreated);
            }
            if (listRequest.isEmpty()) {
                listRequest = null;
            }
        }

        String Approved = "Approved";
        String Rejected = "Rejected";
        // Retain title and deparment when searching View
        List<Department> listDepartment = dao.getAllDepartment();
        request.setAttribute("listDepartment", listDepartment);
        request.setAttribute("title", title);

        request.setAttribute("Approved", Approved);
        request.setAttribute("Rejected", Rejected);

        request.setAttribute("departmentID", departmentID);
        request.setAttribute("listRequest", listRequest);
        request.getRequestDispatcher("viewRequest.jsp").forward(request, response);

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
