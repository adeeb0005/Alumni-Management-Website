/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Data.Servlets;

import com.Data.Helper.ConnectionProvider;
import com.Data.Helper.Helper;
import com.Data.dao.PostDao;
import com.Data.entities.Project;
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
public class AddPojectServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String idea = request.getParameter("idea");
            String feature = request.getParameter("feature");
            String link = request.getParameter("link");
            Part part = request.getPart("repo");
            String repoName = part.getSubmittedFileName();
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("currentUser");
            String student_id = user.getStudent_id();
            String username = user.getName();
            int sid = user.getId();
            Project project = new Project(idea, feature, link, repoName, student_id, username, sid);
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            String path = request.getRealPath("/")+"img"+File.separator+repoName;
            if(dao.saveProject(project)){
                if(Helper.saveFile(part.getInputStream(), path)){
                    out.println("done");
                }
            }
            else{
                out.println("Error");
            }
            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("viewproject.jsp");
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
