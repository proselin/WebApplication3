/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.text.html.HTML;

/**
 *
 * @author quoch
 */
public class order_model {
//    public void Show_order(){}
//    public Order create_order(){}
//    public boolean update_order(){}
//    public boolean update_status_order(){}
//    public Order create_order(String userid ){}

    public static void main(String[] args) {
     
    }

    public Order search_Order_Data(String orid) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        Order or = new Order();
        String sql = "SELECT * FROM tblOrder WHERE orderID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "ORDER001");
            ResultSet rs = ps.executeQuery();
            rs.next();

            or.setOrderID(rs.getString(1));
            or.setOrderDate(rs.getDate(2));
            or.setOrderDes(rs.getString(3));
            or.setOrderStatus(rs.getString(4));
            or.setOrderAddress(rs.getString(5));
            or.setOrderCustommerName(rs.getString(6));
            or.setOrderEmailContract(rs.getString(7));
            or.setOrderPhoneNumber(rs.getString(8));
            or.setOrderTotalPrice(rs.getFloat(9));
            or.setOrderPaymentMethod(rs.getString(10));
            or.setUserID(rs.getString(11));
            or.setVouID(rs.getString(12));

            rs.close();
            ps.close();
            conn.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return or;
    }

    public boolean insert_Product_To_Order(String productid, String orderid, int quantity, float price) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        boolean result = false;
        String sql = "INSERT INTO [dbo].[tblOrder_Detail]\n"
                + "           ([pID]\n"
                + "           ,[orderID]\n"
                + "           ,[Quantity]\n"
                + "           ,[Current_Price])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)\n"
                + "GO";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, productid);
            ps.setString(2, orderid);
            ps.setInt(3, quantity);
            ps.setFloat(4, price);
           
            if ( ps.executeUpdate() >0){
                result = true;
            }
            ps.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
        
    }
    

    public boolean create_order(String orderDes, String orderStatus, String orderAddress, String orderCustommerName, String orderEmailContract, String orderPhoneNumber, float orderTotalPrice, String orderPaymentMethod, String UserID, String vouID) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        boolean result = false;
        //Create new order ;
        String sql = "INSERT INTO tblOrder "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ";
        try {
            // time for comapre
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            //start insert
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(11, UserID);
            ps.setString(12, vouID);
            ps.setString(10, orderPaymentMethod);
            ps.setFloat(9, orderTotalPrice);
            ps.setString(8, orderPhoneNumber);
            ps.setString(7, orderEmailContract);
            ps.setString(6, orderCustommerName);
            ps.setString(5, orderAddress);
            ps.setString(4, orderStatus);
            ps.setString(3, orderDes);
            ps.setDate(2, date);
            ps.setString(1, create_New_ID());

            if (ps.executeUpdate() != 0) {
                result = true;
            }
            ps.close();
            conn.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return result;

    }

    private static String create_New_ID() {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        String result = null;
        String sql = "SELECT orderID FROM  tblOrder ORDER BY orderID DESC";
        try {
            Statement ps = conn.createStatement();
            ResultSet rs = ps.executeQuery(sql);
            rs.next();
            String last = rs.getString(1);
            String strnumber = last.substring(5, last.length());
            String strname = last.substring(0, 5);
            int number = Integer.parseInt(strnumber);
            result = strname + (number + 1);

            rs.close();
            ps.close();
            conn.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return result;

    }
//    public add_product_to_order(String orderID)
}
