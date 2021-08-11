/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DigitalDAO;
import entity.Digital;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            try {
                DigitalDAO dao = new DigitalDAO();
                
                // Get data from front end
                String input = request.getParameter("search");
                String index = request.getParameter("index");
                ArrayList<Digital> top5 = dao.getTop5Article();
                
                int page;
                if (index == null) {
                    index = "1";
                }
                try {
                    page = Integer.parseInt(index);
                } catch (NumberFormatException e) {
                    page = 1;
                }
                
                // return list have 3 row with input
                List<Digital> listSearch = dao.search(input, page);
                int sizeList = dao.getTotalRecords(input);
                int pageSize = 3;
                // to padding number page with total record receive from input
                int pageIndex = sizeList / pageSize + (sizeList % pageSize == 0 ? 0 : 1);

                String error = "";
                
                // error
                if (listSearch.size() == 0) {
                    error = "NOT FOUND!!!";
                }

                // set attributes
                request.setAttribute("top5", top5);
                request.setAttribute("listSearch", listSearch);
                request.setAttribute("endPage", pageIndex);
                request.setAttribute("index", page);
                request.setAttribute("txt", input);
                request.setAttribute("error", error);

                request.getRequestDispatcher("home.jsp").forward(request, response);
            } catch (Exception e) {
                request.setAttribute("erorr", e.getMessage());
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
