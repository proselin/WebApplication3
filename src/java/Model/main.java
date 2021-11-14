/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Product;
import Entity.User;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author quoch
 */
public class main {

    public static void main(String[] args) {
        product_model pm = new product_model();
        user_Model us = new user_Model();
        System.out.println(pm.get_all_product().get(0).getImgs());
        img_model im = new img_model();
        System.out.println(pm.get_product_info("PRO1").getImgs().get(0).getImgURL());
        
        String java = "100point1000";
        String[]part = java.split("point");
        String part1 = part[0];
        String part2 = part[1];
        
        System.out.println(part1);
        System.out.println(part2);
    }
}
