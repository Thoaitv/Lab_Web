/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author thoai
 */
public class Solve {
    private int id;
    private int requestID;
    private int accountID;
    private Date dateClose;
    private String status;
    private String solution;

    public Solve() {
    }

    public Solve(int id, int requestID, int accountID, Date dateClose, String status, String solution) {
        this.id = id;
        this.requestID = requestID;
        this.accountID = accountID;
        this.dateClose = dateClose;
        this.status = status;
        this.solution = solution;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public Date getDateClose() {
        return dateClose;
    }

    public void setDateClose(Date dateClose) {
        this.dateClose = dateClose;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    @Override
    public String toString() {
        return "Solve{" + "id=" + id + ", requestID=" + requestID + ", accountID=" + accountID + ", dateClose=" + dateClose + ", status=" + status + ", solution=" + solution + '}';
    }
    
}
