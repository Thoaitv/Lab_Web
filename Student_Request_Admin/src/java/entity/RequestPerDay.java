/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author thoai
 */
public class RequestPerDay {
    int departmentId;
    String departmentName;
    int numberOfRequest;

    public RequestPerDay() {
    }

    public RequestPerDay(int departmentId, String departmentName, int numberOfRequest) {
        this.departmentId = departmentId;
        this.departmentName = departmentName;
        this.numberOfRequest = numberOfRequest;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public int getNumberOfRequest() {
        return numberOfRequest;
    }

    public void setNumberOfRequest(int numberOfRequest) {
        this.numberOfRequest = numberOfRequest;
    }
    
}
