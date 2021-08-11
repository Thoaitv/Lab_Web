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
public class Image {
    int gallery_id;
    String image;

    public Image() {
    }

    public Image(int gallery_id, String image) {
        this.gallery_id = gallery_id;
        this.image = image;
    }

    public int getGallery_id() {
        return gallery_id;
    }

    public void setGallery_id(int gallery_id) {
        this.gallery_id = gallery_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
}
