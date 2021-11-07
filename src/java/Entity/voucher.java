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
public class voucher {
    private String vouID ;
    private String vouName;
    private float vouValues;
    private Date vouDate_Expired;
    private String vouStatus;
    private String vouRule;

    public voucher(String vouID, String vouName, float vouValues, Date vouDate_Expired, String vouStatus, String vouRule) {
        this.vouID = vouID;
        this.vouName = vouName;
        this.vouValues = vouValues;
        this.vouDate_Expired = vouDate_Expired;
        this.vouStatus = vouStatus;
        this.vouRule = vouRule;
    }

    public voucher() {
    }

    public String getVouID() {
        return vouID;
    }

    public void setVouID(String vouID) {
        this.vouID = vouID;
    }

    public String getVouName() {
        return vouName;
    }

    public void setVouName(String vouName) {
        this.vouName = vouName;
    }

    public double getVouValues() {
        return vouValues;
    }

    public void setVouValues(float vouValues) {
        this.vouValues = vouValues;
    }

    public Date getVouDate_Expired() {
        return vouDate_Expired;
    }

    public void setVouDate_Expired(Date vouDate_Expired) {
        this.vouDate_Expired = vouDate_Expired;
    }

    public String getVouStatus() {
        return vouStatus;
    }

    public void setVouStatus(String vouStatus) {
        this.vouStatus = vouStatus;
    }

    public String getVouRule() {
        return vouRule;
    }

    public void setVouRule(String vouRule) {
        this.vouRule = vouRule;
    }
    
    
}
