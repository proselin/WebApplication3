/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author quoch
 */
import Controller.product_controller;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Entity.Product;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class product_model {

    public ArrayList<Product> search_product(String search) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        ArrayList<Product> pro = new ArrayList();
        String sql = "SELECT * FROM tblproduct WHERE pName LIKE %?%";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, search);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setpID(rs.getString(1));
                p.setpName(rs.getString(2));
                p.setpPrice(rs.getFloat(3));
                p.setpDes(rs.getString(4));
                p.setpSale_Quantity(rs.getInt(5));
                p.setpCurrent_Quantity(rs.getInt(6));
                p.setpYear(rs.getInt(7));
                p.setpGet_Date(rs.getDate(8));
                p.setpBrand(rs.getString(9));
                p.setpGender(rs.getString(10));
                p.setpIncense(rs.getString(11));
                p.setpMadeIn(rs.getString(12));
                p.setpRate_Count(rs.getInt(13));
                p.setpStatus(rs.getString(14));
                p.setCateID(rs.getString(15));
                pro.add(p);
            }
            rs.close();
            ps.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
        return pro;
    }

    public ArrayList<Product> get_all_product() {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        ArrayList<Product> pro = new ArrayList();
        String sql = "SELECT * FROM tblproduct";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Product p = new Product();
                p.setpID(rs.getString(1));
                p.setpName(rs.getString(2));
                p.setpPrice(rs.getFloat(3));
                p.setpDes(rs.getString(4));
                p.setpSale_Quantity(rs.getInt(5));
                p.setpCurrent_Quantity(rs.getInt(6));
                p.setpYear(rs.getInt(7));
                p.setpGet_Date(rs.getDate(8));
                p.setpBrand(rs.getString(9));
                p.setpGender(rs.getString(10));
                p.setpIncense(rs.getString(11));
                p.setpMadeIn(rs.getString(12));
                p.setpRate_Count(rs.getInt(13));
                p.setpStatus(rs.getString(14));
                p.setCateID(rs.getString(15));
                pro.add(p);
            }
            rs.close();
            st.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
        return pro;
    }

    public ArrayList<Product> get_9_product() {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        ArrayList<Product> pro = new ArrayList();
        String sql = "SELECT TOP 9 * FROM tblproduct ORDER by pGet_Date DESC ";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Product p = new Product();
                p.setpID(rs.getString(1));
                p.setpName(rs.getString(2));
                p.setpPrice(rs.getFloat(3));
                p.setpDes(rs.getString(4));
                p.setpSale_Quantity(rs.getInt(5));
                p.setpCurrent_Quantity(rs.getInt(6));
                p.setpYear(rs.getInt(7));
                p.setpGet_Date(rs.getDate(8));
                p.setpBrand(rs.getString(9));
                p.setpGender(rs.getString(10));
                p.setpIncense(rs.getString(11));
                p.setpMadeIn(rs.getString(12));
                p.setpRate_Count(rs.getInt(13));
                p.setpStatus(rs.getString(14));
                p.setCateID(rs.getString(15));
                pro.add(p);
            }
            rs.close();
            st.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
        return pro;
    }

    public boolean Create_product(String pName, Float pPrice, String pDes, int pCurrent_Quantity, int pYear, String pBrand, String pGender, String pIncense, String pMadeIn, int pRate_Count, String cateID) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        boolean result = false;
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        String sql = "INSERT INTO tblProduct VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, create_id_product());
            ps.setString(2, pName);
            ps.setFloat(3, pPrice);
            ps.setString(4, pDes);
            ps.setInt(5, 0);
            ps.setInt(6, pCurrent_Quantity);
            ps.setInt(7, pYear);
            ps.setDate(8, date);
            ps.setString(9, pBrand);
            ps.setString(10, pGender);
            ps.setString(11, pIncense);
            ps.setString(12, pMadeIn);
            ps.setInt(13, pRate_Count);
            ps.setString(14, "Available");
            ps.setString(15, cateID);
            if (ps.executeUpdate() != 0) {
                result = true;
            }
            ps.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

    public boolean update_product(String pID ,String pName, Float pPrice, String pDes, int pCurrent_Quantity, int pYear, String pBrand, String pGender, String pIncense, String pMadeIn,String pStatus) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        boolean result = false;
        String sql = "UPDATE [dbo].[tblProduct]\n"
                + "   SET \n"
                + "      [pName] = ?\n"
                + "      ,[pPrice] = ?\n"
                + "      ,[pDes] = ?\n"
                + "      ,[pCurent_Quantity] = ?\n"
                + "      ,[pYear] = ? \n"
                + "      ,[pBrand] = ?\n"
                + "      ,[pGender] = ?\n"
                + "      ,[pIncense] = ?\n"
                + "      ,[pMadeIn] = ?\n"
                + "      ,[pStatus] = ?\n"
                + " WHERE pID = ?  ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pName);
            ps.setFloat(2, pPrice);
            ps.setString(3, pDes);
            ps.setInt(4, pCurrent_Quantity);
            ps.setInt(5, pYear);
            ps.setString(6, pBrand);
            ps.setString(7, pGender);
            ps.setString(8, pIncense);
            ps.setString(9, pMadeIn);
            ps.setString(10, pStatus);
            ps.setString(11, pID);
            if (ps.executeUpdate() != 0) {
                result = true;
            }
            ps.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;
    }

    public String create_id_product() {
        ArrayList<Product> prlist = get_all_product();
        return "PRO" + (prlist.size() + 1);
    }

    public Product get_product_info(String productId) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        Product p = new Product();
        String sql = "Select * from tblProduct Where pID =?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(0, productId);
            ResultSet rs = ps.executeQuery();
            //get data

            p.setpID(rs.getString(1));
            p.setpName(rs.getString(2));
            p.setpPrice(rs.getFloat(3));
            p.setpDes(rs.getString(4));
            p.setpSale_Quantity(rs.getInt(5));
            p.setpCurrent_Quantity(rs.getInt(6));
            p.setpYear(rs.getInt(7));
            p.setpGet_Date(rs.getDate(8));
            p.setpBrand(rs.getString(9));
            p.setpGender(rs.getString(10));
            p.setpIncense(rs.getString(11));
            p.setpMadeIn(rs.getString(12));
            p.setpRate_Count(rs.getInt(13));
            p.setpStatus(rs.getString(14));
            p.setCateID(rs.getString(15));

            rs.close();
            ps.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println(e);
        }
        return p;
    }

    public boolean take_Product(String id, int quantity) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        boolean result = false;
        //check current quantity
        String sql = "Update tblProduct Set pCurent_quantity = pCurent_quantity - ? Where pID =?";
        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);

            if (ps.executeUpdate() > 0) {
                result = true;
            }
            ps.close();;
            conn.close();

        } catch (Exception e) {
        }
        return result;

    }

    public boolean add_New_Quantity_Product(String id, int quantity) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        boolean result = false;
        //check current quantity
        String sql = "Update tblProduct Set pCurent_quantity = pCurent_quantity + ? Where pID =?";
        try {

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, quantity);

            if (ps.executeUpdate() > 0) {
                result = true;
            }
            ps.close();;
            conn.close();

        } catch (Exception e) {
        }
        return result;

    }

    public static float get_Current_price(String pID) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        float result = 0;
        String sql = "SELECT pPrice FROM tblProduct WHERE pID = ? ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, pID);
            ResultSet rs = ps.executeQuery();
            result = rs.getFloat(1);

            rs.close();
            ps.close();
            conn.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return result;
    }

}
