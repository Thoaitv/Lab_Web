/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Contact;
import entity.Gallery;
import entity.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author thoai
 */
public class PhotographerDAO extends DBContext {

    // Create and execute an SQL statement that returns some data.
    public List<Gallery> getListGallery() {
        List<Gallery> list = new ArrayList<>();
        String sql = "SELECT * FROM Galery ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            // Iterate through the data in the result set and return it.
            while (rs.next()) {
                Gallery galery = new Gallery();
                galery.setId(rs.getInt("id"));
                galery.setTitle(rs.getString("title"));
                galery.setDescription(rs.getString("description"));
                galery.setName(rs.getString("name"));
                galery.setImage(rs.getString("image"));
                list.add(galery);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // Create and execute an SQL statement that returns some data.
    //get Contact top 1 
    public Contact getContact() {
        String query = "SELECT TOP 1 * FROM Contact";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setPhone_num(rs.getString("phone_number"));
                contact.setEmail(rs.getString("email"));
                contact.setFb(rs.getString("fb"));
                contact.setTwitter(rs.getString("twitter"));
                contact.setGg(rs.getString("gg"));
                contact.setAbout(rs.getString("about"));
                contact.setAddress(rs.getString("address"));
                contact.setCity(rs.getString("city"));
                contact.setCountry(rs.getString("country"));
                contact.setMap(rs.getString("map"));
                contact.setImage_main(rs.getString("image"));
                return contact;
            }

        } catch (Exception e) {
        }
        return null;
    }

    // Create and execute an SQL statement that returns some data.
    //get Galery by id 
    public Gallery getGaleryByID(int Gid) {
        String sql = "SELECT * FROM Galery WHERE Id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Gid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Gallery galery = new Gallery();
                galery.setId(rs.getInt("id"));
                galery.setTitle(rs.getString("title"));
                galery.setDescription(rs.getString("description"));
                galery.setName(rs.getString("name"));
                galery.setImage(rs.getString("image"));
                return galery;
            }
        } catch (Exception e) {
        }
        return null;
    }

    // Create and execute an SQL statement that returns some data.
    //get list 8 Image by id
    public List<Image> getListImgByGID(int Gid) {
        List<Image> list = new ArrayList<>();
        String sql = "SELECT TOP 8 * FROM Image WHERE gallery_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Gid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Image i = new Image();
                i.setGallery_id(rs.getInt("gallery_id"));
                i.setImage(rs.getString("image"));
                list.add(i);
            }
        } catch (Exception e) {
        }
        return list;
    }

    // Create and execute an SQL statement that returns some data.
    //get view home page
    public int getViewsHome() {
        String sql = "SELECT * FROM Views ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("view");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    // Update view up to jsp front end
    public void updateView() {
        int count = 0;
        try {
            String sql = "UPDATE [Views] SET [view] = [view]+ 1";
            PreparedStatement st = connection.prepareStatement(sql);
            int rs = st.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Create and execute an SQL statement that returns some data.
    // get view Gallery
    public int getViews(int Gid) {
        //get views Galery by id 
        String sql = "SELECT views FROM Galery WHERE Id = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Gid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("views");
            }
        } catch (Exception e) {
        }
        return 0;
    }

    // Create and execute an SQL statement that returns some data.
    //update views Galery by id 
    public void updateViewGallery(int Gid) {
        String sql = "UPDATE Galery SET views = views + 1 where Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Gid);
            int rs = st.executeUpdate();
        } catch (Exception e) {
        }
    }

}
