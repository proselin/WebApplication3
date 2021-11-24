/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import Entity.Product;
import Model.product_model;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author quoch
 */
@WebServlet(urlPatterns = {"/testcart"})
public class testcart extends HttpServlet {

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
        if (ac.equals("doincr")) {
            String id = request.getParameter("id");
            String txt = "";
            Cookie arr[] = request.getCookies();
            if (arr != null) {
                for (Cookie o : arr) {
                    if (o.getName().equals("id")) {
                        txt = txt + o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }

            if (txt.isEmpty()) {
                txt = id;
                Cookie c = new Cookie("id", txt);
                c.setMaxAge(60 * 60 * 24);
                response.addCookie(c);
            } else {
                txt = txt + "," + id;
                Cookie c = new Cookie("id", txt);
                c.setMaxAge(60 * 60 * 24);
                response.addCookie(c);
            }

            response.sendRedirect("testcart?ac=doshow");
        }
        if (ac.equals("docheckout")) {
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
                for (int j = i + 1; j < list.size(); j++) {
                    if (list.get(i).getpID().equals(list.get(j).getpID())) {
                        count++;
                        list.remove(j);
                        j--;
                        list.get(i).setTake(count);
                    }
                }
            }
            for (Cookie o : arr) {// go di gia tri cu va gan gia tri moi cho cookie 
                o.setMaxAge(0);// xoa cookie 
                response.addCookie(o);// them lai cookie
            }
            response.sendRedirect("index.jsp");
        }
        if (ac.equals("doremove")) {
            String id = request.getParameter("id");
            Cookie arr[] = request.getCookies();
            String txt = "";
            for (Cookie o : arr) {
                if (o.getName().equals("id")) {
                    txt = txt + o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
            String ids[] = txt.split(",");
            String txtOutPut = "";
            for (int i = 0; i < ids.length; i++) {
                if (!ids[i].equals(id)) {
                    if (txtOutPut.isEmpty()) {
                        txtOutPut = ids[i];
                    } else {
                        txtOutPut = txtOutPut + "," + ids[i];
                    }
                }
            }
            if (!txtOutPut.isEmpty()) {
                Cookie c = new Cookie("id", txtOutPut);
                c.setMaxAge(60 * 60 * 24);
                response.addCookie(c);
            }
            response.sendRedirect("testcart?ac=doshow");
        }
        if (ac.equals("doshow")) {
            Cookie arr[] = request.getCookies();
            List<Product> list = new ArrayList<>();
            product_model pm = new product_model();
            for (Cookie o : arr) {
                if (o.getName().equals("id")) {
                    String txt[] = o.getValue().split(",");
                    for (String s : txt) {
                        list.add(pm.get_product_info(s));
                    }
                }
            }
            if (list.size() >= 2) {
                for (int i = 0; i < list.size(); i++) {
                    int count = 1;
                    for (int j = i + 1; j < list.size(); j++) {
                        if (list.get(i).getpID().equals(list.get(j).getpID())) {
                            count++;
                            list.remove(j);
                            j--;
                            list.get(i).setTake(count);
                        }
                    }
                }
            }

            double total = 0;
            for (Product o : list) {
                total = total + o.getTake() * o.getpPrice();
            }
            request.setAttribute("list", list);
            request.setAttribute("total", total);
            request.setAttribute("vat", 0.1 * total);
            request.setAttribute("sum", 1.1 * total);
            request.getRequestDispatcher("shop-cart.jsp").forward(request, response);
        }
        if (ac.equals("dodecr")) {
            String id = request.getParameter("id");
            Cookie arr[] = request.getCookies();
            String txt = "";
            for (Cookie o : arr) {
                if (o.getName().equals("id")) {
                    txt = txt + o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
            String ids[] = txt.split(",");
            String txtOutPut = "";
            int check = 0;
            for (int i = 0; i < ids.length; i++) {
                if (ids[i].equals(id)) {
                    check++;
                }
                if (check != 1) {
                    if (txtOutPut.isEmpty()) {
                        txtOutPut = ids[i];
                    } else {
                        txtOutPut = txtOutPut + "," + ids[i];
                    }
                } else {
                    check++;
                }
            }
            if (!txtOutPut.isEmpty()) {
                Cookie c = new Cookie("id", txtOutPut);
                c.setMaxAge(60 * 60 * 24);
                response.addCookie(c);
            }
            response.sendRedirect("testcart?ac=doshow");
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
