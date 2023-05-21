<%-- 
    Document   : admin
    Created on : Apr 8, 2023, 9:25:30 PM
    Author     : yatha
--%>

<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="jdk.nashorn.internal.runtime.regexp.JoniRegExp.Factory"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in!! Login First ");
        response.sendRedirect("sign.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not Admin!! ");
            response.sendRedirect("sign.jsp");
            return;

        }
    }

%>
<%-- 
    Document   : index
    Created on : Apr 7, 2023, 2:14:42 PM
    Author     : yatharth
--%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Admin</title>

        <link rel="stylesheet" href="./css/admin.css">
        <link rel="stylesheet" href="./css/index.css">
        <link rel="stylesheet" href="./css/sign.css">

        <script
            src="https://kit.fontawesome.com/a6e9596273.js"
            crossorigin="anonymous"
        ></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>




        <section class="AdminOptions">

            <!--message-->
            <%@include file="components/message.jsp"%>


            <div class="option-container">
                <div class="indiOp" style="background-image:url(./resources/team.png);"></div>
                <div class="option-title">
                    <h2 class="num">2342</h2>
                    <h2>USERS</h2>
                </div>

            </div>
            <div class="option-container">
                <div class="indiOp" style="background-image:url(./resources/list.png);"></div>
                <div class="option-title">
                    <h2 class="num">23432</h2>
                    <h2>CATEGORIES</h2>
                </div>

            </div>
            <a href="adminBooks.jsp">
                <div class="option-container">
                <div class="indiOp" style="background-image:url(./resources/book-stack.png);"></div>
                <div class="option-title">
                    <h2 class="num">234</h2>
                    <h2>BOOKS</h2>
                </div>

            </div>
            </a>
            
            <div class="option-container third">
                <div class="indiOp" style="background-image:url(./resources/book.png);"></div>
                <div class="option-title">
                    <p>Click Here to add new Category</p>
                    <h2>ADD CATEGORY</h2>
                </div>


            </div>
            <div class="option-container fourth">
                <div class="indiOp" style="background-image:url(./resources/plus.png);"></div>
                <div class="option-title">
                    <p>Click here to add new Product</p>
                    <h2>ADD BOOK</h2>
                </div>

            </div>
        </section>
            
        <!--Add Category form-->
        <form class="popup" action="ProductOperationServlet" method="post" >
            <input type="hidden" value="addCategory" name="operation">
            <div class="form-title">Fill Category Details</div>
            <div class="entry">
                <input type="text" name="catTitle" placeholder="Enter Category Title">
                <input type="text" name="categoryPic" placeholder="Picture Url" >
                <textarea  rows="5" name="description" cols="33" type="text" placeholder="Enter Category Description"> </textarea>
            </div>
            <div class="buttons-two addCategory">
                <button type="submit" class="btn addCat">Add Category</button>
                <button type="button" class="btn close">Close</button>
            </div>


        </form>

        <!-- Add product form -->
        <form class="popup2" action="ProductOperationServlet" method="post" enctype="multipart/form-data">
            <input type="hidden" value="addProduct" name="operation">
            <div class="form-title">Product Details</div>
            <div class="entry">
                <input type="text" name="pName" placeholder="Enter Book Name">
                <textarea  rows="5" name="pDes"cols="33" type="text" placeholder="Enter Book description"></textarea>
                <input type="text" name="pAuthor"placeholder="Author Name">
                <input type="text" name="pPublisher" placeholder="Publisher">
                <input type="text" name="pYear" placeholder="Year Of Publication">
                   
                <!--product category reading-->
                <%
                    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                    List<Category> list=cdao.getCategories();
                %>
                
                
                
                
                <select name="catId" id="drop-down" placeholder="Select Category">
                    <% for(Category c:list){
                    %>
                        
                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                    <%}%>
                </select>
                <input type="text" name="pUrl"placeholder="Enter Book Source">
                <p style="color:red">Picture URL</p>
                <input  name="pPhoto" type="text">

            </div>
            <div class="buttons-two addCategory">
                <button type="submit" class="btn addCat">Add Book</button>
                <button type="button" class="btn addBook">Close</button>
            </div>


        </form>
        <script src="./js/admin.js"></script>
        <script src="./js/script.js"></script>
    </body>
</html>
