/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Digital;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thoai
 */
public class DigitalDAO extends DBContext {

    
// Get top number article to show last articles to show last articles
    public Digital getTop1LastestArticle() {
        
        // select lastest article have earliest time
        String query = "SELECT TOP 1 * FROM dbo.Articles ORDER BY [time] DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Digital d = new Digital();
                d.setId(rs.getInt("id"));
                d.setArticle(rs.getString("article"));
                d.setContent(rs.getString("content"));
                d.setShortContent(rs.getString("shortContent"));
                d.setImage("img/" + rs.getString("image"));
                d.setAuthor(rs.getString("author"));
                d.setTime(rs.getTimestamp("time"));
                return d;
            }

        } catch (Exception e) {
        }
        return null;
    }
    
// Get 5 record articles by id from database
    public ArrayList<Digital> getTop5Article() {
        ArrayList<Digital> article = new ArrayList<>();
        try {
            // Select 5 records don't have lastest record
            String sql = "SELECT TOP 5 * FROM dbo.Articles WHERE [time] NOT IN (SELECT MAX([time]) FROM dbo.Articles) ORDER BY [time] DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Digital d = new Digital();
                d.setId(rs.getInt("id"));
                d.setArticle(rs.getString("article"));
                d.setContent(rs.getString("content"));
                d.setShortContent(rs.getString("shortContent"));
                d.setImage("img/" + rs.getString("image"));
                d.setAuthor(rs.getString("author"));
                d.setTime(rs.getTimestamp("time"));

                article.add(d);
            }
        } catch (Exception e) {
        }
        return article;
    }

    
    // get 5 records articles by id, but don't have id selected
    public ArrayList<Digital> getTop5Article(int id) {
        ArrayList<Digital> article = new ArrayList<>();
        try {
            // select
            String sql = "SELECT TOP 5 * FROM dbo.Articles WHERE id != ? ORDER BY [time] DESC";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Digital d = new Digital();
                d.setId(rs.getInt("id"));
                d.setArticle(rs.getString("article"));
                d.setContent(rs.getString("content"));
                d.setShortContent(rs.getString("shortContent"));
                d.setImage("img/" + rs.getString("image"));
                d.setAuthor(rs.getString("author"));
                d.setTime(rs.getTimestamp("time"));

                article.add(d);
            }
        } catch (Exception e) {
        }
        return article;
    }
// Get all articles by id
    public Digital getArticleById(int id) {
        // Select article have id take from input form 
        String sql = "SELECT * FROM dbo.Articles WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Digital d = new Digital();
                d.setId(rs.getInt("id"));
                d.setArticle(rs.getString("article"));
                d.setContent(rs.getString("content"));
                d.setShortContent(rs.getString("shortContent"));
                d.setImage("img/" + rs.getString("image"));
                d.setAuthor(rs.getString("author"));
                d.setTime(rs.getTimestamp("time"));
                return d;
            }
        } catch (Exception e) {
        }
        return null;
    }
// get all records from table article to get number of record return
    public int getTotalRecords(String input) {
        try {
            // Return all number of record have condittion like input by user
            String sql = "SELECT COUNT(*) AS TotalRecords FROM Articles WHERE article LIKE '%'+ ? +'%'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, input);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("TotalRecords");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    // From keyword input use sql command to search in database an return data
    public ArrayList<Digital> search(String input, int pageIndex) {
        ArrayList<Digital> articles = new ArrayList<>();
        // Select 3 row in 1 page sort by Id of Articles 
        String sql = "SELECT * FROM Articles where article like ? ORDER BY id ASC OFFSET (?-1)*3 ROWS FETCH FIRST 3 ROWS ONLY";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + input + "%");
            st.setInt(2, pageIndex);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Digital d = new Digital();
                d.setId(rs.getInt("id"));
                d.setArticle(rs.getString("article"));
                d.setContent(rs.getString("content"));
                d.setShortContent(rs.getString("shortContent"));
                d.setImage("img/" + rs.getString("image"));
                d.setAuthor(rs.getString("author"));
                d.setTime(rs.getTimestamp("time"));
                articles.add(d);
            }
        } catch (Exception e) {
        }
        return articles;
    }

//    public List<Digital> getListByPage(List<Digital> list, int start, int end) {
//        List<Digital> arr = new ArrayList<>();
//        for (int i = start; i < end; i++) {
//            arr.add(list.get(i));
//        }
//        return arr;
//    }
//
//    
//    
//    public List<Digital> pagingSearchArticle(String text) {
//        List<Digital> list = new ArrayList<>();
//        // Create and execute an SQL statement that returns some data.
//        String sql = "SELECT  * FROM Articles WHERE article LIKE ?";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, "%" + text + "%");
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Digital d = new Digital();
//                d.setId(rs.getInt("id"));
//                d.setArticle(rs.getString("article"));
//                d.setContent(rs.getString("content"));
//                d.setShortContent(rs.getString("shortContent"));
//                d.setImage("img/" + rs.getString("image"));
//                d.setAuthor(rs.getString("author"));
//                d.setTime(rs.getTimestamp("time"));
//                list.add(d);
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
    
    
    //    public ArrayList<Digital> search(String input, int pageIndex, int pageSize) {
//        ArrayList<Digital> articles = new ArrayList<>();
//        try {
//            String sql = "WITH t AS (SELECT ROW_NUMBER() OVER (ORDER BY [time] DESC) rownum,\n"
//                    + "*FROM dbo.Articles WHERE article LIKE '%?%')"
//                    + " SELECT * FROM t WHERE t.rownum >= (?-1)*?+1 AND rownum <= ? * ? ";
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, input);
//            ps.setInt(2, pageIndex);
//            ps.setInt(3, pageSize);
//            ps.setInt(4, pageIndex);
//            ps.setInt(5, pageSize);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Digital d = new Digital();
//                d.setId(rs.getInt("id"));
//                d.setArticle(rs.getString("article"));
//                d.setContent(rs.getString("content"));
//                d.setShortContent(rs.getString("shortContent"));
//                d.setImage("img/" + rs.getString("image"));
//                d.setAuthor(rs.getString("author"));
//                d.setTime(rs.getTimestamp("time"));
//                articles.add(d);
//            }
//        } catch (Exception e) {
//        }
//        return articles;
//    }
}
