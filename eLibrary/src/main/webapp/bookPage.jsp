<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.entities.Books"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
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
<link rel="stylesheet" href="./css/sign.css">
<link rel="stylesheet" href="./css/bookPage.css">
    <script
      src="https://kit.fontawesome.com/a6e9596273.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
     
      
      <%
          User user=(User)session.getAttribute("current-user");
          if(user==null){
            session.setAttribute("message","Login First to read the book");
            response.sendRedirect("sign.jsp");
            return;
          }
          
          
          
          
          
            String cat=request.getParameter("bookId");
            
            ProductDao dao=new ProductDao(FactoryProvider.getFactory());
            Books book=null;


           int cid=Integer.parseInt(cat.trim());
            book=dao.getProductById(cid);
           
          
          
            
          
           
           CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
           List<Category> clist=cdao.getCategories();
           Category catId=book.getCategory();
           
      %>
      
       
        <%@include file="components/navbar.jsp"%>
      
  

    <!-- Book Details -->
    <!-- Title Banner -->
    <section class="title-banner" style="padding-top: 7rem;">
        <h2><%=book.getpName()%></h2>
    </section>

    <section class="bookBody">
     <div class="bookImage" style="background-image: url(https://drive.google.com/uc?export=view&id=<%=book.getpPhoto()%>);"></div>
     <div class="bookInfo">
      <h2 class="bookName">
       <%=book.getpName()%>
      </h2>
      <h3><%=book.getpAuthor()%></h3>
      <h4><%=book.getpPublisher()%></h4>
      <h3 class="bookCategory">
       <%=catId.getCategoryTitle()%>
      </h3>
      <p class="book-Description">
       <%=book.getpDesc()%>
      </p>
      <a href="<%=book.getpUrl()%>">
          <button type="button" class="open-book submitBtn">
        Read
       </button>
      </a>
     </div>
    </section>
    

    <!-- animation script -->
      <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
    <script src="script.js"></script>
    
	
  </body>
</html>






    

