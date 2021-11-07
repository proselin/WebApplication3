/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.order_model;
import Model.voucher_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author quoch
 */
@WebServlet(name = "order_controller", urlPatterns = {"/order_controller"})
public class order_controller extends HttpServlet {

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
      
                String des = request.getParameter("txtDes");
                String fName = request.getParameter("txtFname");
                String lName = request.getParameter("txtFname");
                String address1 = request.getParameter("txtaddress1");
                String address2 = request.getParameter("txtAddress2");
                String address3 = request.getParameter("txtaddress3");
                String address4 = request.getParameter("txtaddress4");
                String address5 = request.getParameter("txtaddress5");
                String phone = request.getParameter("txtPhone");
                String email = request.getParameter("txtEmail");
                
                

                //test
                order_model om = new order_model();
                float total = 10000;
                String name = fName + " " + lName;
                String address = address1 + "  " + address2 + "   "; //+ address3 + "  " + address4 + "  " + address5 + "   ";
                String vouID = "VOU002";
                String UserID = "USER001";
                boolean success = false;
                int check = 0;
                boolean create = false;
                voucher_Model vm = new voucher_Model();
                if (vm.check_Status_voucher(vouID, UserID)) {
                    total = total - vm.get_voucher(vouID);
                    create = om.create_order(des, "Wait", address, name, email, phone, total, "Recei", UserID, vouID);
                    if (create == true) {
                        vm.use_voucher_user(UserID, vouID);
                        success = true;
                    }

                }
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<meta charset=\"UTF-8\">");
                out.println("<title>Servlet order_controller</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Servlet order_controller at " + request.getContextPath() + "</h1>");
                out.println("<p> Address = " + address + "<p>");
                out.println("<p> Name = " + fName + " " + lName + "<p>");
                out.println("<p> Success ? = " + success + "<p>");
                out.println("<p> crate ? = " + create + "<p>");
                out.println("<p> total ? = " + total + "<p>");
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
