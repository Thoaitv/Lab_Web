/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Account;
import entity.Department;
import entity.Request;
import entity.RequestPerDay;
import entity.Solve;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thoai
 */
public class DAO extends DBContext {

    // Check Account Exit in the Database
    public boolean checkAccountExist(String username) {
        String query = "SELECT * FROM Account WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Account a = new Account(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"));
                if (a != null) {
                    return true;
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return false;
    }

    // Get account right username and password to login the system
    public Account login(String username, String password) {
        String query = "SELECT * FROM Account WHERE username = ? and [password] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    // Get list Request sent in one day
    public List<RequestPerDay> getRequestPerDay(String currentDate) {
        List<RequestPerDay> list = new ArrayList<>();
        // Select (count of dateCreated, departmentID, name Department)
        String query = "SELECT COUNT(dateCreated) AS number, d.id AS dId, d.[name] AS [name] "
                + "FROM Request r JOIN Department d ON r.departmentID = d.id "
                + "WHERE dateCreated = ? GROUP BY dateCreated,d.id, d.[name]";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, formatDate(currentDate));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RequestPerDay r = new RequestPerDay(
                        rs.getInt("dId"),
                        rs.getString("name"),
                        rs.getInt("number"));
                list.add(r);
            }
            return list;
        } catch (Exception e) {
        }
        return null;

    }

    // Format date from d/m/y to y-m-d to DB can excute
    public static String formatDate(String date) {
        date = date.trim();
        String day = date.substring(0, 2);
        String month = date.substring(3, 5);
        String year = date.substring(6);
        return (year + "-" + month + "-" + day);
    }

    // Get 2 latest requests
    public List<RequestPerDay> getRequest2LastDay(String date1stLastDay, String date2ndLastDay) {
        List<RequestPerDay> list = new ArrayList<>();
        // Select count of dateCreated, departmentID, name Department of 2 day lastest
        // Load infor of request sent in 2 lastest day
        String query = "SELECT SUM(number) AS number,requestInDay.dId, requestInDay.[name] FROM (\n"
                + "                SELECT COUNT(dateCreated) AS number, d.id AS dId, d.[name] AS [name]\n"
                + "                FROM Request r\n"
                + "                JOIN Department d ON r.departmentID = d.id\n"
                + "                WHERE dateCreated = ? OR dateCreated = ?\n"
                + "                GROUP BY dateCreated,d.id, d.[name]) AS requestInDay \n"
                + "                GROUP BY requestInDay.dId, requestInDay.[name]";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, date1stLastDay);
            ps.setString(2, date2ndLastDay);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                RequestPerDay r = new RequestPerDay(
                        rs.getInt("dId"),
                        rs.getString("name"),
                        rs.getInt("number"));
                list.add(r);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    // Get all department to view search
    public List<Department> getAllDepartment() {
        List<Department> list = new ArrayList<>();
        //Get all department
        String query = "SELECT * FROM Department";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Department d = new Department(rs.getInt(1), rs.getString(2));
                list.add(d);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    // Get list request 2 last day
    // get from Request, Department, Student
    public List<Request> getRequest2LastDay(String departmentID, String last1day, String last2day) {
        List<Request> list = new ArrayList<>();
        String query = "SELECT r.id, r.title, r.dateCreated, st.studentID, st.studentName, \n"
                + "                r.content, d.[name] AS department\n"
                + "              FROM Request r\n"
                + "               JOIN Department d ON d.id = r.departmentID\n"
                + "                JOIN Student st ON st.id = r.studentID\n"
                + "                WHERE 1 =1 \n"
                + "                AND departmentID = ?\n"
                + "                AND r.dateCreated= ? \n"
                + "                OR departmentID = ? AND r.dateCreated = ?\n"
                + "                ORDER BY dateCreated DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, departmentID);
            ps.setString(2, last1day);
            ps.setString(3, departmentID);
            ps.setString(4, last2day);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Request r = new Request(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getDate("dateCreated"),
                        "",
                        "",
                        rs.getString("studentID"),
                        rs.getString("studentName"),
                        rs.getString("content"),
                        rs.getString("department"),
                        "");
                list.add(r);
            }

            DAO dao = new DAO();
            for (Request o : list) {
                Solve s = dao.checkSolved(o.getId());
                if (s != null) {
                    o.setDateClose(s.getDateClose() + "");
                    o.setStatus(s.getStatus());
                    o.setSolution(s.getSolution());
                } else {
                    o.setDateClose("N/A");
                    o.setStatus("in progress");
                }
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

// Check solve by requestID
    public Solve checkSolved(int requestID) {
        String query = "SELECT * FROM Solve WHERE requestID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Solve(
                        rs.getInt("id"),
                        rs.getInt("requestID"),
                        rs.getInt("accountID"),
                        rs.getDate("dateClose"),
                        rs.getString("status"),
                        rs.getString("solution"));
            }

        } catch (Exception e) {
        }
        return null;
    }

    // View Request with Department and Request Title search
    public List<Request> getRequestDepartment(String departmentID, String title) {
        List<Request> list = new ArrayList<>();
        String query = "SELECT r.id, r.title, r.dateCreated, st.studentID, st.studentName, \n"
                + "r.content, d.[name] AS department\n"
                + "FROM Request r \n"
                + "JOIN Department d ON d.id = r.departmentID\n"
                + "JOIN Student st ON st.id = r.studentID\n"
                + "WHERE 1 = 1 AND departmentID = ? \n";
        if (title != null || title != "") {
            query += " AND title LIKE ? ";
        }
        query += "ORDER BY dateCreated DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, departmentID);
            ps.setString(2, "%" + title + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Request r = new Request(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getDate("dateCreated"),
                        "",
                        "",
                        rs.getString("studentID"),
                        rs.getString("studentName"),
                        rs.getString("content"),
                        rs.getString("department"),
                        "");
                list.add(r);
            }
            DAO dao = new DAO();
            for (Request o : list) {
                Solve s = dao.checkSolved(o.getId());
                if (s != null) {
                    o.setDateClose(s.getDateClose() + "");
                    o.setStatus(s.getStatus());
                    o.setSolution(s.getSolution());
                } else {
                    o.setDateClose("N/A");
                    o.setStatus("in progress");
                }
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    // Get DepartID, title and dataCreated
    public List<Request> getRequestDepartment(String departmentID, String title, String dateCreated) {
        List<Request> list = new ArrayList<>();
        // Create and execute an SQL statement that returns list of data.
        //Get list request by Department ID, date, title
        String query = "SELECT r.id, r.title, r.dateCreated, st.studentID, st.studentName, \n"
                + "r.content, d.[name] AS department\n"
                + "FROM Request r \n"
                + "JOIN Department d ON d.id = r.departmentID\n"
                + "JOIN Student st ON st.id = r.studentID\n"
                + "WHERE 1 = 1 AND departmentID = ? \n";
        if (title != null || title != "") {
            query += " AND title LIKE ? ";
        }
        if (dateCreated != null || dateCreated != "") {
            query += " AND r.dateCreated = '" + formatDate(dateCreated) + "'";
        }
        query += " ORDER BY dateCreated DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, departmentID);
            ps.setString(2, "%" + title + "%");
//            ps.setString(3, formatDate(dateCreated));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Request r = new Request(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getDate("dateCreated"),
                        "",
                        "",
                        rs.getString("studentID"),
                        rs.getString("studentName"),
                        rs.getString("content"),
                        rs.getString("department"),
                        "");
                list.add(r);
            }

            DAO dao = new DAO();
            
            // Duyệt cả list Request
            for (Request o : list) {
                // Check xem cái Request Đã được giải quyết
                Solve s = dao.checkSolved(o.getId());
                // Nếu mà giải quyết rồi
                if (s != null) {
                    o.setDateClose(s.getDateClose() + "");
                    o.setStatus(s.getStatus());
                    o.setSolution(s.getSolution());
                    // Set những thông
                } else {
                    o.setDateClose("N/A");
                    o.setStatus("in progress");
                }
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    // Get request by ID after that Solve
    public Request getRequestByID(int requestID) {
        Request r = null;
        // Create and execute an SQL statement that returns list of data.
        // Get request by ID
        String query = "SELECT r.id, r.title, r.dateCreated, st.studentID, st.studentName,\n"
                + "r.content, d.[name] AS department\n"
                + "FROM Request r\n"
                + "JOIN Department d ON d.id = r.departmentID\n"
                + "JOIN Student st ON st.id = r.studentID\n"
                + "WHERE  r.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, requestID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                r = new Request(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getDate("dateCreated"),
                        "",
                        "",
                        rs.getString("studentID"),
                        rs.getString("studentName"),
                        rs.getString("content"),
                        rs.getString("department"),
                        "");
            }
            DAO dao = new DAO();
            // Loop all requests, See which requests have been processed OR not
            Solve s = dao.checkSolved(r.getId());
            // If Solved
            if (s != null) {
                r.setDateClose(s.getDateClose() + "");
                r.setStatus(s.getStatus());
                r.setSolution(s.getSolution());

            } else {
                r.setDateClose("N/A");
                r.setStatus("in progress");
            }
            return r;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    // add solve
    public void addSolve(int requestID, int accountID, String dateClose, String status, String solution) {
        //Add new request has solved to database
        String query = "INSERT INTO[Solve] \n"
                + "	(requestID, accountID,[dateClose], [status], solution) \n"
                + "     VALUES\n"
                + "	(?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, requestID);
            ps.setInt(2, accountID);
            ps.setString(3, formatDate(dateClose));
            ps.setString(4, status);
            ps.setString(5, solution);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("loi o add"+e.getMessage());
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        dao.getRequestDepartment("1", "");
        List<Request> list = dao.getRequestDepartment("1", "");
        for (Request request : list) {
            System.out.println(request.toString());
        }

//DAO dao = new DAO();
//dao.addSolve(5, 2, "2021-05-30", "test", "solu");

        Request r = dao.getRequestByID(12);
        System.out.println(r.toString());
    }
}
