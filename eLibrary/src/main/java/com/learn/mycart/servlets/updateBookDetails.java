/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.learn.mycart.servlets;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Books;
import com.learn.mycart.entities.Category;
import com.learn.mycart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yatha
 */
public class updateBookDetails extends HttpServlet {

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
            
                String op = request.getParameter("operation");
                int bookId=Integer.parseInt(op.trim());
                System.out.println("This is book iD"+bookId);
                String pName = request.getParameter("pName");
                String pDes = request.getParameter("pDes");
                String pAuthor = request.getParameter("pAuthor");
                String pPublisher = request.getParameter("pPublisher");
                String pYear = request.getParameter("pYear");
                String pPhoto = request.getParameter("pPhoto");
                String pUrl = request.getParameter("pUrl");
                int catId= Integer.parseInt(request.getParameter("catId"));
                System.out.println(pAuthor);
                Books p=new Books();              
                p.setpAuthor(pAuthor);
               p.setpDesc(pDes);
               p.setpName(pName);
                p.setpPhoto(pPhoto);
                p.setpUrl(pUrl);
                p.setpPublisher(pPublisher);
                p.setpYear(pYear);
                
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                Category category=cdao.getCategoryById(catId);      
                p.setCategory(category);
     
                
                //product save
                 ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                pdao.updateBookDetails(p,bookId);
                  
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Book Details Updated Successfully!");
                response.sendRedirect("adminBooks.jsp");
                return;
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
