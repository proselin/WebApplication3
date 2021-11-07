/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author quoch
 */
public class Product {
   private String pID;
   private String pName;
   private Float pPrice;
   private String pDes;
   private int pSale_Quantity;
   private int pCurrent_Quantity;
   private Date pGet_Date;
   private Date pYear;
   private String pBrand;
   private String pConcentration;
   private String pCapacity;
   private String pIncense;
   private int pRate_Count;
   private String pStatus;
   private String cateID;

    @Override
    public String toString() {
        return "Product{" + "pID=" + pID + ", pName=" + pName + ", pPrice=" + pPrice + ", pDes=" + pDes + ", pSale_Quantity=" + pSale_Quantity + ", pCurrent_Quantity=" + pCurrent_Quantity + ", pGet_Date=" + pGet_Date + ", pYear=" + pYear + ", pBrand=" + pBrand + ", pConcentration=" + pConcentration + ", pCapacity=" + pCapacity + ", pIncense=" + pIncense + ", pRate_Count=" + pRate_Count + ", pStatus=" + pStatus + ", cateID=" + cateID + '}';
    }

    public Product(String pID, String pName, Float pPrice, String pDes, int pSale_Quantity, int pCurrent_Quantity, Date pGet_Date, Date pYear, String pBrand, String pConcentration, String pCapacity, String pIncense, int pRate_Count, String pStatus, String cateID) {
        this.pID = pID;
        this.pName = pName;
        this.pPrice = pPrice;
        this.pDes = pDes;
        this.pSale_Quantity = pSale_Quantity;
        this.pCurrent_Quantity = pCurrent_Quantity;
        this.pGet_Date = pGet_Date;
        this.pYear = pYear;
        this.pBrand = pBrand;
        this.pConcentration = pConcentration;
        this.pCapacity = pCapacity;
        this.pIncense = pIncense;
        this.pRate_Count = pRate_Count;
        this.pStatus = pStatus;
        this.cateID = cateID;
    }

    public Product() {
    }

    public String getpID() {
        return pID;
    }

    public void setpID(String pID) {
        this.pID = pID;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public Float getpPrice() {
        return pPrice;
    }

    public void setpPrice(Float pPrice) {
        this.pPrice = pPrice;
    }

    public String getpDes() {
        return pDes;
    }

    public void setpDes(String pDes) {
        this.pDes = pDes;
    }

    public int getpSale_Quantity() {
        return pSale_Quantity;
    }

    public void setpSale_Quantity(int pSale_Quantity) {
        this.pSale_Quantity = pSale_Quantity;
    }

    public int getpCurrent_Quantity() {
        return pCurrent_Quantity;
    }

    public void setpCurrent_Quantity(int pCurrent_Quantity) {
        this.pCurrent_Quantity = pCurrent_Quantity;
    }

    public Date getpGet_Date() {
        return pGet_Date;
    }

    public void setpGet_Date(Date pGet_Date) {
        this.pGet_Date = pGet_Date;
    }

    public Date getpYear() {
        return pYear;
    }

    public void setpYear(Date pYear) {
        this.pYear = pYear;
    }

    public String getpBrand() {
        return pBrand;
    }

    public void setpBrand(String pBrand) {
        this.pBrand = pBrand;
    }

    public String getpConcentration() {
        return pConcentration;
    }

    public void setpConcentration(String pConcentration) {
        this.pConcentration = pConcentration;
    }

    public String getpCapacity() {
        return pCapacity;
    }

    public void setpCapacity(String pCapacity) {
        this.pCapacity = pCapacity;
    }

    public String getpIncense() {
        return pIncense;
    }

    public void setpIncense(String pIncense) {
        this.pIncense = pIncense;
    }

    public int getpRate_Count() {
        return pRate_Count;
    }

    public void setpRate_Count(int pRate_Count) {
        this.pRate_Count = pRate_Count;
    }

    public String getpStatus() {
        return pStatus;
    }

    public void setpStatus(String pStatus) {
        this.pStatus = pStatus;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }
   
   
}
