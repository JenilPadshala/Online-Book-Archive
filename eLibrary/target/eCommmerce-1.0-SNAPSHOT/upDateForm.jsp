<%-- 
    Document   : upDateForm
    Created on : Apr 17, 2023, 3:11:51 AM
    Author     : yatha
--%>

<%@page import="com.learn.mycart.entities.Books"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Form</title>
        <link rel="stylesheet" href="./css/index.css" />
    <link rel="stylesheet" href="./css/adminBooks.css" />
     <link rel="stylesheet" href="./css/admin.css" />
     <link rel="stylesheet" href="./css/bookPage.css" />
    <link rel="stylesheet" href="./css/sign.css">
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/a6e9596273.js"
      crossorigin="anonymous"
    ></script>
    </head>
    <body >
         <%@include file="components/navbar.jsp"%>
        <%String bId=request.getParameter("uId");
            out.println(bId);
            ProductDao p=new ProductDao(FactoryProvider.getFactory());
            int cId=Integer.parseInt(bId.trim());
            Books b=p.getProductById(cId);

        %>
        
        
        
        
        <form class="popup2"  style= "top:8rem;z-index:1" action="updateBookDetails" method="post" >
            <input type="hidden" value=<%=cId%> name="operation">
            <div class="form-title">Product Details</div>
            <div class="entry">
                <input type="text" name="pName" value="<%=b.getpName()%>" placeholder="Enter Book Name">
                <textarea  rows="5" name="pDes" value="" cols="33" type="text" placeholder="Enter Book description"><%=b.getpDesc()%></textarea>
                <input type="text" name="pAuthor" value="<%=b.getpAuthor()%>" placeholder="Author Name">
                <input type="text" name="pPublisher" value="<%=b.getpPublisher()%>" placeholder="Publisher">
                <input type="text" name="pYear" value="<%=b.getpYear()%>" placeholder="Year Of Publication">
                   
                <!--product category reading-->
                <%
                    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                    List<Category> lis=cdao.getCategories();
    
                    Category cat=b.getCategory();
                   

                    
                %>
                
                
                
                
                <select name="catId" value="cat.getCategoryTitle()" id="drop-down" placeholder="Select Category">
                    <% for(Category c:lis){
                    %>
                       <%if(c.getCategoryId()==cat.getCategoryId()){%>
                                
                              <option selected value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                             <%} else{%>
                              <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                             <% }%>
                              
                          
                       =
                    
                    <%}%>
                </select>
                <input type="text" name="pUrl" value="<%=b.getpUrl()%>"placeholder="Enter Book Source">
                <p style="color:red">Picture URL</p>
                <input  value="<%=b.getpPhoto()%>"name="pPhoto" type="text">

            </div>
            <div class="buttons-two addCategory">
                <button type="submit" class="btn addCat">Update</button>
                
            </div>


        </form>
       
    </body>    <script src="./js/script.js"></script>
</html>
