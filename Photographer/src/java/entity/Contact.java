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
public class Contact {
    String phone_num;
    String email;
    String fb;
    String twitter;
    String gg;
    String about;
    String address;
    String city;
    String country;
    String map;
    String image_main;

    public Contact() {
    }

    public Contact(String phone_num, String email, String fb, String twitter, String gg, String about, String address, String city, String country, String map, String image_main) {
        this.phone_num = phone_num;
        this.email = email;
        this.fb = fb;
        this.twitter = twitter;
        this.gg = gg;
        this.about = about;
        this.address = address;
        this.city = city;
        this.country = country;
        this.map = map;
        this.image_main = image_main;
    }

    public String getPhone_num() {
        return phone_num;
    }

    public void setPhone_num(String phone_num) {
        this.phone_num = phone_num;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFb() {
        return fb;
    }

    public void setFb(String fb) {
        this.fb = fb;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    public String getGg() {
        return gg;
    }

    public void setGg(String gg) {
        this.gg = gg;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMap() {
        return map;
    }

    public void setMap(String map) {
        this.map = map;
    }

    public String getImage_main() {
        return image_main;
    }

    public void setImage_main(String image_main) {
        this.image_main = image_main;
    }

    

    
}
