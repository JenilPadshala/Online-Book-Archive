
package com.learn.mycart.dao;

import com.learn.mycart.entities.Books;
import com.learn.mycart.entities.Category;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class ProductDao {
   
    private SessionFactory factory;
    public ProductDao(SessionFactory factory){
        this.factory=factory;
    }
    
    public boolean saveProduct(Books product){
        boolean f=false;
        try{
           Session session= this.factory.openSession();
           Transaction tx=session.beginTransaction();
           session.save(product);
           tx.commit();
           session.close();
           f=true;
        }catch(HibernateException e){
            e.printStackTrace();
            f=false;
        }
        return f;
    }
    
    
    //fetching all products
    
    public List<Books> getAllProducts(){
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Books");
        List<Books> list=query.list();
        return list;
    }
    
      public List<Books> getAllProductsById(int cid){
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Books as p where p.category.categoryId=:id");
        query.setParameter("id",cid);
        List<Books> list=query.list();
        return list;
    }
      
        public Books getProductById(int cid){
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Books as p where p.pId=:id");
        query.setParameter("id",cid);
        Books list=(Books) query.uniqueResult();
        return list;
    }
        
        public void deleteProductById(int cid){
        Session s=this.factory.openSession();
        Transaction tx=s.beginTransaction();
        Query query=s.createQuery("delete from Books as p where p.pId=:id");
        query.setParameter("id",cid);
        query.executeUpdate();
        System.out.println("Deleted");
        tx.commit();
        
        
       
        
    }
        public void updateBookDetails(Books b,int pId1){
        Session s=this.factory.openSession();
        Transaction tx=s.beginTransaction();
        String pYear1=b.getpYear();
        String pName1=b.getpName();
        String pDesc1=b.getpDesc();
        String pPhoto1=b.getpPhoto();
        String pUrl1=b.getpUrl();
        String pPublisher1=b.getpPublisher();
        String pAuthor1=b.getpAuthor();
        System.out.println(pPublisher1);
        Category category=b.getCategory();
        int catt=category.getCategoryId();
//
          Query query=s.createQuery("update Books set pAuthor=:pAuthor1,pDesc=:pDesc1,pName=:pName1,pYear=:pYear1,pUrl=:pUrl1,pPublisher=:pPublisher1,pPhoto=:pPhoto1,category_categoryId=:catt where  pId=:pId1");
          query.setParameter("pName1",pName1);
          query.setParameter("pId1",pId1);
          System.out.println(pName1+" "+pId1);
        query.setParameter("pAuthor1",pAuthor1);
        query.setParameter("pDesc1",pDesc1);
        query.setParameter("pPublisher1",pPublisher1);
        query.setParameter("pAuthor1",pAuthor1);
        query.setParameter("pUrl1",pUrl1);
        query.setParameter("pPhoto1",pPhoto1);
        query.setParameter("catt",catt);
        query.setParameter("pYear1",pYear1);
          
        query.executeUpdate();
        System.out.println("Updated");
        tx.commit();
        
        
       
        
    }
        
    
    
}
