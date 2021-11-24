/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Entity.Product;
import Entity.User;
import Entity.category;
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
import java.util.Arrays;

/**
 *
 * @author quoch
 */
public class main {

    public static void main(String[] args) {
        product_model pm = new product_model();
        user_Model us = new user_Model();
        img_model im = new img_model();
        cate_model cate = new cate_model();
        voucher_Model vou = new voucher_Model();
        ArrayList<User> usa = us.User_Data();
        System.out.println(usa.toString());
        System.out.println(pm.get_all_product());
        System.out.println();
        System.out.println(Arrays.toString(vou.explainrule(vou.get_voucher("VOU001").getVouRule())));
        System.out.println(vou.show_All_Voucher("USER001").get(0).getVouDate_Create());
        System.out.println(vou.get_user_Voucher("USER001"));

    }
}
