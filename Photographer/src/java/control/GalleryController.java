/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.PhotographerDAO;
import entity.Contact;
import entity.Gallery;
import entity.Image;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "GalleryController", urlPatterns = {"/GalleryController"})
public class GalleryController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */

            // load list Gallery
            PhotographerDAO dao = new PhotographerDAO();
            List<Gallery> listGallery = dao.getListGallery();
//            int size= listGarely.size();

//          get list Gallery by id Gallary
            int Gid = 0;
            String galeryID = request.getParameter("galeryID");
            Gid = Integer.parseInt(galeryID);
            Gallery gallery = dao.getGaleryByID(Gid);

            // get list 8 image to load small picture
            List<Image> listImg = dao.getListImgByGID(Gid);
            Contact contact = dao.getContact();

//          update view
//     
            int view = dao.getViews(Gid);
            //upate views in db
            view = view + 1;
            dao.updateViewGallery(Gid);
            //format number to 6 number
            NumberFormat formatter = new DecimalFormat("000000");
            //format 
            String newViews = formatter.format(view);
            //create List 
            List views = new ArrayList();
            for (int i = newViews.length() - 1; i >= 0; i--) {
                views.add(newViews.charAt(i));
            }


            request.setAttribute("totalViews", views);
            request.setAttribute("listImg", listImg);
            request.setAttribute("gallery", gallery);
            request.setAttribute("active", Gid);
            request.setAttribute("list", listGallery);
            request.setAttribute("contact", contact);
            request.getRequestDispatcher("Gallery.jsp").forward(request, response);
//            request.getRequestDispatcher("test.jsp").forward(request, response);

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
