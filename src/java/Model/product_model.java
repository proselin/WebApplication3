/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author quoch
 */
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Entity.Product;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class product_model {

    public static void main(String[] args) {
    }

    public ArrayList<Product> get_product_info() {
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
                p.setpGet_Date(rs.getDate(7));
                p.setpYear(rs.getDate(8));
                p.setpBrand(rs.getString(9));
                p.setpConcentration(rs.getString(10));
                p.setpCapacity(rs.getString(11));
                p.setpIncense(rs.getString(12));
                p.setpStatus(rs.getString(13));
                p.setCateID(rs.getString(14));
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

    public static void printew(ArrayList<Product> pro) {
        Product pr = new Product();
        for (int i = 0; i < pro.size(); i++) {
            pr = pro.get(i);
            System.out.println(pr.toString());
        }
    }

    public void Create_product(String pID, String pName, String pPrice, String pDes, int pSale_Quantity, int pCurrent_Quantity, Date pGet_Date, Date pYear, String pBrand, String pConcentration, String pCapacity, String pIncense, int pRate_Count, String pStatus, String cateID) {
    }

    public void update_product() {
    }

    public void create_id_product() {
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
            p.setpGet_Date(rs.getDate(7));
            p.setpYear(rs.getDate(8));
            p.setpBrand(rs.getString(9));
            p.setpConcentration(rs.getString(10));
            p.setpCapacity(rs.getString(11));
            p.setpIncense(rs.getString(12));
            p.setpStatus(rs.getString(13));
            p.setCateID(rs.getString(14));

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
