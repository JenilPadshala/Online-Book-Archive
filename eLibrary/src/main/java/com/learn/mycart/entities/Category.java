
package com.learn.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@Entity
public class Category{
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    
    private int categoryId;
    private String categoryTitle;
    private String categoryDescription;
    private String categoryPic;
    @OneToMany(mappedBy="category")
    private List<Books> products=new ArrayList<>();
    
    public Category() {
    }

    public Category(int categoryId, String categoryTitle, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
    }

    public Category(String categoryTitle, String categoryDescription,List<Books> products) {
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.products=products;
    }
    

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Books> getProducts() {
        return products;
    }

    public void setProducts(List<Books> products) {
        this.products = products;
    }

    public String getCategoryPic() {
        return categoryPic;
    }

    public void setCategoryPic(String categoryPic) {
        this.categoryPic = categoryPic;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription=" + categoryDescription + ", categoryPic=" + categoryPic + ", products=" + products + '}';
    }

    public Category(int categoryId, String categoryTitle, String categoryDescription, String categoryPic) {
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.categoryPic = categoryPic;
    }

    public Category(String categoryTitle, String categoryDescription, String categoryPic) {
        this.categoryTitle = categoryTitle;
        this.categoryDescription = categoryDescription;
        this.categoryPic = categoryPic;
    }
    
    

   
    
    
    
}
