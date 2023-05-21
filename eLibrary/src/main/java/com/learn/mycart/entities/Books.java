
package com.learn.mycart.entities;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table (name = "books")

public class Books {
     @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int pId;
    private String pName;
    @Column(length=3000)
    private String pDesc;
    private String pPhoto;
    private String pAuthor;
    private String pPublisher;
    private String pYear;
    private String pUrl;
    @ManyToOne
    private Category category;

    public Books() {
    }

    public Books(int pId, String pName, String pDesc, String pPhoto, String pAuthor, String pPublisher, String pYear, String pUrl, Category category) {
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pAuthor = pAuthor;
        this.pPublisher = pPublisher;
        this.pYear = pYear;
        this.pUrl = pUrl;
        this.category = category;
    }

    public Books(String pName, String pDesc, String pPhoto, String pAuthor, String pPublisher, String pYear, String pUrl, Category category) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pAuthor = pAuthor;
        this.pPublisher = pPublisher;
        this.pYear = pYear;
        this.pUrl = pUrl;
        this.category = category;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public String getpAuthor() {
        return pAuthor;
    }

    public void setpAuthor(String pAuthor) {
        this.pAuthor = pAuthor;
    }

    public String getpPublisher() {
        return pPublisher;
    }

    public void setpPublisher(String pPublisher) {
        this.pPublisher = pPublisher;
    }

    public String getpYear() {
        return pYear;
    }

    public void setpYear(String pYear) {
        this.pYear = pYear;
    }

    public String getpUrl() {
        return pUrl;
    }

    public void setpUrl(String pUrl) {
        this.pUrl = pUrl;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Books{" + "pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", pAuthor=" + pAuthor + ", pPublisher=" + pPublisher + ", pYear=" + pYear + ", pUrl=" + pUrl + ", category=" + category + '}';
    }

    

   
    
    
}
