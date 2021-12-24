/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.order_model;
import java.io.IOException;
import java.io.PrintWriter;
import Entity.*;
import Model.product_model;
import Model.user_Model;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author quoch
 */
@WebServlet(name = "payment", urlPatterns = {"/payment"})
public class payment extends HttpServlet {

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
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String country = request.getParameter("country");
        String address = request.getParameter("address");
        String towncity = request.getParameter("towncity");
        String state = request.getParameter("state");
        String postcode = request.getParameter("postcode");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String des = request.getParameter("des");
        Float total = Float.parseFloat(request.getParameter("total"));
        address = address + ";" + towncity + ";" + state + ";" + country + ";" + postcode;
        String payment = request.getParameter("payment");
        order_model om = new order_model();

        Order or = null;
        Object userid = null;
        userid = session.getAttribute("use");
        if (userid == null) {
            if ("pay".equals(payment)) {

                or = om.create_order(des, "Waiting for payment", address, name, email, phone, total, "Pay when receive", null, null);

            }
        } else {
            if (request.getParameter("vouid") != null) {
                if ("pay".equals(payment)) {
                    or = om.create_order(des, "Waiting for payment", address, name, email, phone, total, phone, session.getAttribute("use").toString(), request.getParameter("vouid"));
                }
            } else {
                if ("pay".equals(payment)) {
                    or = om.create_order(des, "Waiting for payment", address, name, email, phone, total, phone, session.getAttribute("use").toString(), null);
                }
            }
        }

        if (or != null) {
            user_Model um = new user_Model();
            Cookie arr[] = request.getCookies();
            List<Product> list = new ArrayList<>();
            product_model pm = new product_model();
            for (Cookie o : arr) {// xu ly chuoi cookie 
                if (o.getName().equals("id")) {
                    String txt[] = o.getValue().split(",");
                    for (String s : txt) {
                        list.add(pm.get_product_info(s));
                    }
                }
            }
            for (int i = 0; i < list.size(); i++) {
                int count = 1;
                list.get(i).setTake(1);
                for (int j = i + 1; j < list.size(); j++) {
                    if (list.get(i).getpID().equals(list.get(j).getpID())) {
                        count++;
                        list.remove(j);
                        list.get(i).setTake(count);
                    }
                }
            }
            String orid = or.getOrderID();
            for (Product p : list) {
                pm.take_Product(p.getpID(), p.getTake());
                pm.set_Product_to_order(orid, p.getpID(), p.getTake(), p.getpPrice());
            }
            for (Cookie o : arr) {// go di gia tri cu va gan gia tri moi cho cookie 
                o.setMaxAge(0);// xoa cookie 
                response.addCookie(o);// them lai cookie
            }
            if (userid != null) {
                int point = total.intValue();
                point = point * 1 / 4;
                User u = um.search_User_Data(userid.toString());
                um.update_User_Data(userid.toString(),
                        u.getFullName(),
                        u.getAddress(),
                        u.getGender(),
                        u.getPhone(),
                        u.getEmail(),
                        u.getDate_of_birth(),
                        u.getPassword(),
                        point,
                        u.getRoleID());
            }
            request.setAttribute("order", or);
            request.getRequestDispatcher("review.jsp").forward(request, response);
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
