/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import Entity.voucher;
import Entity.voucher_user;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;

/**
 *
 * @author quoch
 */
public class voucher_Model {


    public ArrayList<voucher> show_All_Voucher() {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        ArrayList<voucher> listvou = new ArrayList<>();
        String sql = "Select * from tblVoucher";
        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            //get date from the database 
            while (rs.next()) {
                voucher vc = new voucher();
                String id = rs.getString("vouID");
                String name = rs.getString("vouName");
                float Values = rs.getFloat("vouValues");
                Date exdate = rs.getDate("vouDate_Expired");
                Date crdate = rs.getDate("vouDate_Create");
                String status = rs.getString("vouStatus");
                String rule = rs.getString("vouRule");
                vc = new voucher(id, name, Values, crdate, status, rule);
                listvou.add(vc);
            }
            rs.close();
            st.close();
            conn.close();

        } catch (Exception e) {
        }
        return listvou;
    }

    public  ArrayList<voucher_user> show_user_Voucher(String uid) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        ArrayList<voucher_user> uvlist = new ArrayList<voucher_user>();
        String sql = "SELECT * FROM voucher_user WHERE voucher_user.UserID = ? ORDER BY voucher_user.vouID DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, uid);
            ResultSet rs = ps.executeQuery();
            voucher_user vu = new voucher_user();
            while (rs.next()) {
                vu.setVouID(rs.getString("vouID"));
                vu.setUserID(rs.getString("UserID"));
                vu.setStatus(rs.getString("_status"));
                uvlist.add(vu);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return uvlist;
    }

    public boolean check_Status_voucher(String vouid, String userid) {
        boolean result = false;
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        String sql = "Select _Status  "
                + "from  Voucher_user  "
                + "where UserID = ? "
                + "and vouID = ? ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userid);
            ps.setString(2, vouid);
//            Statement st = conn.createStatement();
            ResultSet rs = ps.executeQuery();
            //get String 
            rs.next();
            if (rs.getString("_Status").equals("Available")) {
                result = true;
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result;

    }

    public float get_voucher(String vouid) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        float result = 0;
        String sql = "Select vouValues from tblVoucher where vouID = ?";
        try {
            try ( PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, vouid);
                ResultSet rs = ps.executeQuery();
                rs.next();
                result = rs.getFloat("vouValues");
                rs.close();
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return result;

    }

    public void use_voucher_user(String userid, String vouid) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        String sql = "Update Voucher_user set _Status =  'Unavailable' "
                + "WHERE Voucher_user.UserId = ? and Voucher_user.vouID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userid);
            ps.setString(2, vouid);
//            Statement st = conn.createStatement();
            ps.executeUpdate();
            ps.close();
            conn.close();

        } catch (Exception ex) {

        }
    }

    public void change_status_voucher_all_user(String vouid) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        String sql = "Update Voucher_user set _Status =  'Unavailable' "
                + "WHERE  Voucher_user.VoucherID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(0, vouid);
//            Statement st = conn.createStatement();
            ps.executeUpdate(sql);

            ps.close();
            conn.close();

        } catch (Exception ex) {

        }
    }

    public void claim_vocher(String vouid, String userid) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        String sql = " insert into Voucher_user "
                + "values (?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(0, vouid);
            ps.setString(1, userid);
            ps.setString(2, "Available");
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void check_status_all_voucher() {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        // get date using for compare 
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        String sql = "Select vouID ,vouDate_Expired from tblVoucher";
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Date exdate = rs.getDate("vouDate_Expired");

                if (exdate.compareTo(date) < 0) {
                    String vouid = rs.getString("vouID");
                    change_status_voucher_all_user(vouid);
                    change_status_voucher(vouid);
                }
            }

        } catch (Exception e) {
        }
    }

    public void change_status_voucher(String id) {
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        String sql = "Update tblVoucher Set vouStatus = ? Where vouID =? ";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(0, "Expired");
            ps.setString(1, id);
            ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception ex) {
        }
    }

}
