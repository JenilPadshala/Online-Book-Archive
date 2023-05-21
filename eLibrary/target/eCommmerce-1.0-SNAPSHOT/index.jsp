<%-- 
    Document   : index
    Created on : Apr 7, 2023, 2:14:42 PM
    Author     : yatharth
--%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Books"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.learn.mycart.entities.User"%>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SRMAP Library</title>
    <link rel="stylesheet" href="./css/index.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
      <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400&display=swap" rel="stylesheet">
    <script
      src="https://kit.fontawesome.com/a6e9596273.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="bodyBack"></div>
    
       
      
       <%
            String cat=request.getParameter("category");
            
            ProductDao dao=new ProductDao(FactoryProvider.getFactory());
            List<Books> list=null;

           if(cat==null || cat.trim().equals("all")){
                list=dao.getAllProducts();
           }
           else{
           int cid=Integer.parseInt(cat.trim());
            list=dao.getAllProductsById(cid);
           
           }
           
          
            
          
           
           CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
           List<Category> clist=cdao.getCategories();
           

           User user1=(User)session.getAttribute("current-user");

           
           

          
            
        %>
        <div class="bodyBack"></div>
<section class="navbar">
      <navbar>
        <div class="logo"><img src="./resources/srmap logo.png" alt="" /></div>
        <div class="options">
          <ul>
            <li><a href="./index.jsp">Home</a></li>
            <li><a>Categories +</a>
              <ul>
                 <%for(Category c:clist){%>
                <li><a href="index.jsp?category=<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></a></li>
                <%}%>
              </ul>
              
            </li>
            <li><a href="./requestBook.jsp">Request Book</a></li>
            
            <li><a href="">About Us</a></li>
            
            <%
                if(user1==null){
                %>
                <li><a href="./sign.jsp">Login/Register</a></li>
                <%
                }
                else if(user1.getUserType().equals("admin"))
                {
                    %>
                <li><a href="/eCommmerce/admin.jsp"><%=user1.getUserName()%></a></li>
                 <li><a href="LogOutServlet">Logout </a></li>
                    
                <%}   



                else{
                    %>
                <li><a href="#"><%=user1.getUserName()%></a></li>
                <li><a href="LogOutServlet">Logout </a></li>
                
                <%}
            
            %>
            
          </ul>
        </div>
        <div class="hamburger">
          <span class="bar"></span>
          <span class="bar"></span>
          <span class="bar"></span>
        </div>
      </navbar>
    </section>
        
        
        
        
         




    <section class="product categories"> 
      <hr>
        <button class="pre-btn"><i class="fa-solid fa-chevron-left"></i></button>
        <button class="nxt-btn"><i class="fa-solid fa-chevron-right"></i></button>
        <div class="product-container">
            
         <a href="index.jsp?category=all">
                <div class="items">
                     <div class="bPic" style="background-image: url(./resources/category1.png);"></div>
                     <p>All Books</p>
                   </div> 
            </a>
            
            <% for(Category c:clist){%>
            <a href="index.jsp?category=<%=c.getCategoryId()%>">
                <div class="items">
                     <div class="bPic" style="background-image: url(https://drive.google.com/uc?export=view&id=<%=c.getCategoryPic()%>);"></div>
                     <p><%=c.getCategoryTitle()%></p>
                   </div> 
            </a>
                    
            <%}
            %>
            
        



        </div>
        <hr>
    </section>
    <!-- Categories -->
    <section class="banner" style="background-image:url(./resources/Banner1.jpg)">

    </section>
   
    <section class="allBooks">
      <h3 class="categoryTitle">Explore </h3>
     
      <div class="bookContainer">
          
       
        <% for(Books b:list){%>
        <a href="bookPage.jsp?bookId=<%=b.getpId()%>">
            <div class="items bookItems" data-aos="fade-left"  data-aos-delay="150">
          <div class="bPic bookPic" style="background-image: url(https://drive.google.com/uc?export=view&id=<%=b.getpPhoto()%>);"></div>
          <div class="bookName"><%=b.getpName()%></div>
          <div class="author"><%=b.getpAuthor()%></div>
            </div>
        </a>
         <%}%>

          


      </div>
    </section>
    

    <!-- animation script -->
      <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
    <script src="./js/script.js"></script>
    
	
  </body>
</html>






    






    




     