/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Statement;

/**
 *
 * @author quoch
 */
public class main {

    public static void main(String[] args) {

        boolean result = false;
        String sql = "SELECT UserID FROM tblUser WHERE _UserName = ?";
        GetConnection cn = new GetConnection();
        Connection conn = cn.getConnection();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
          ps.setString(1, "User001");
      //      ps.setString(1, "user");
            ResultSet rs = ps.executeQuery();
                        result = rs.next();
            String userID  = rs.getString(1);

            System.out.println(result);
            System.out.println(userID);

            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(checkLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
