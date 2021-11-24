/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Entity.*;
import Model.*;
import java.util.ArrayList;

/**
 *
 * @author quoch
 */
@WebServlet(name = "user_controller", urlPatterns = {"/user_controller"})
public class user_controller extends HttpServlet {

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
        String ac = request.getParameter("ac");
        HttpSession session = request.getSession();
        String userid = session.getAttribute("uid").toString();
        if (userid != null) {
            if (ac.equals("showprofile")) {
                try {

                    user_Model usm = new user_Model();
                    User us = usm.search_User_Data(userid);
                    request.setAttribute("FullName", us.getFullName());
                    request.setAttribute("Address", us.getAddress());
                    request.setAttribute("Gender", us.getGender());
                    request.setAttribute("Phone", us.getPhone());
                    request.setAttribute("Email", us.getEmail());
                    request.setAttribute("Dob", us.getDate_of_birth());
                    request.setAttribute("UserName", us.getUserName());
                    request.setAttribute("Password", us.getPassword());
                    request.setAttribute("Point", us.getPoint());
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                } catch (Exception e) {
                }
                if (ac.equals("show_order_history")) {
                    order_model om = new order_model();

                    try {
                        ArrayList<Order> list = om.get_User_Order(userid);
                        request.setAttribute("Listorder", list);
                        request.getRequestDispatcher("profile.jsp").forward(request, response);
                    } catch (Exception e) {
                    }
                }
                if (ac.equals("Show_voucher")) {
                    voucher vou = new voucher();
                    voucher_Model vm = new voucher_Model();
                    ArrayList<voucher_user> listvou = vm.get_user_Voucher(userid);
                    request.setAttribute("listvou", listvou);

                    
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                }

            } else {
                response.sendRedirect("login.jsp");
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
