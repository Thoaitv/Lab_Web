/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author thoai
 */
public class Request {

    private int id;
    private String title;
    private Date dateCreated;
    private String dateClose;
    private String status;
    private String studentID;
    private String studentName;
    private String content;
    private String toDepartment;
    private String solution;

    public Request() {
    }

    public Request(int id, String title, Date dateCreated, String dateClose, String status, String studentID, String studentName, String content, String toDepartment, String solution) {
        this.id = id;
        this.title = title;
        this.dateCreated = dateCreated;
        this.dateClose = dateClose;
        this.status = status;
        this.studentID = studentID;
        this.studentName = studentName;
        this.content = content;
        this.toDepartment = toDepartment;
        this.solution = solution;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
//-- ->  //
    public String getDateCreated() {
        SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy");
        return formater.format(this.dateCreated);
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getDateClose() {
        return dateClose;
    }

    public void setDateClose(String dateClose) {
        this.dateClose = dateClose;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getToDepartment() {
        return toDepartment;
    }

    public void setToDepartment(String toDepartment) {
        this.toDepartment = toDepartment;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    
    public String getDateCloseFormat() {
        if (this.dateClose.length() > 3) {
            String day = this.dateClose.substring(8);
            String month = this.dateClose.substring(5, 7);
            String year = this.dateClose.substring(0, 4);
            return (day + "/" + month + "/" + year);
        } else {
            return this.dateClose;
        }
    }

    @Override
    public String toString() {
        return "Request{" + "id=" + id + ", title=" + title + ", dateCreated=" + dateCreated + ", dateClose=" + dateClose + ", status=" + status + ", studentID=" + studentID + ", studentName=" + studentName + ", content=" + content + ", toDepartment=" + toDepartment + ", solution=" + solution + '}';
    }

}
