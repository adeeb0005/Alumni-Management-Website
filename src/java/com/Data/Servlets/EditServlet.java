/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Data.Servlets;

import com.Data.Helper.ConnectionProvider;
import com.Data.Helper.Helper;
import com.Data.dao.UserDao;
import com.Data.entities.Message;
import com.Data.entities.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author adeeb
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //fetch all data
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userSession = request.getParameter("user_session");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();
            
            HttpSession s = request.getSession();
            User user = (User)s.getAttribute("currentUser");
            user.setName(userName);
            user.setEmail(userEmail);
            user.setSession(userSession);

            int index = imageName.lastIndexOf('.');
            String extension = imageName.substring(index + 1);
            user.setProfile(user.getStudent_id()+"."+extension);
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = userDao.updateUser(user);
            if(ans){
                out.println("updated to db");
                String path = request.getRealPath("/")+"img"+File.separator+user.getProfile();
                Helper.deleteFile(path);
                if(Helper.saveFile(part.getInputStream(), path)){
                    boolean m = Helper.renameFile(path, user.getStudent_id());
                    Message msg = new Message("Profile details updated", "success", "alert-success");
                    s.setAttribute("msg", msg);
                }
                else{
                    Message msg = new Message("Something went wrong..", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }
            }
            else{
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
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
