<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Books"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SRMAP Library</title>
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
  <body>
      
      
      
      
      <%
    
      String bId=request.getParameter("bId");
      String uId=request.getParameter("uId");
      ProductDao p=new ProductDao(FactoryProvider.getFactory());
      List<Books> list=p.getAllProducts();
      
      if(bId!=null)
      {
        int cId=Integer.parseInt(bId.trim());
        p.deleteProductById(cId);

      
      }
            
      %>
      
      
      
    <div class="bodyBack"></div>
    <%@include file="components/navbar.jsp"%>
    
    <section class="allBooks inAdmin">
                    <!--message-->
           

        <div class="title-banner ofAdmin" >
             <h3 class="categoryTitle adminBooksTitle" style="padding-top: 8rem" >All Books</h3>
             
        </div>
     
     
      <div class="bookContainer adminBookContainer">
           
          <% for(Books b:list){
      
          %>
        <div class="items bookItems adminItems" data-aos="fade-left" data-aos-delay="150">
         
            
            <div
            class="bPic bookPic"
            style="background-image: url(https://drive.google.com/uc?export=view&id=<%=b.getpPhoto()%>)"
          ></div>
          
          <div class="bookName adminBookName"><%=b.getpName()%></div>
          
          <div class="author"><%=b.getpAuthor()%></div>
          
          <div class="update-delete">
          <button type="button" url="adminBooks.jsp?bId=<%=b.getpId()%>" class="submitBtn  btn-up delete">Delete</button>
           <a href="upDateForm.jsp?uId=<%=b.getpId()%>"><button type="button"  class="submitBtn btn-up update">Update</button></a>
          </div>
        </div>
             <%}%>
     </div>
     
    
      
          
         <!-- comment -->

   

    </section>
      <%@include file="components/message.jsp"%>
    <!-- animation script -->
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
      AOS.init();
    </script>
    <script src="./js/script.js"></script>
    <script src="./js/adminBooks.js"></script>
  </body>
</html>
