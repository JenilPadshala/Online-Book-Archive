<%@page import="com.learn.mycart.entities.User"%>
<%
User user1=(User)session.getAttribute("current-user");
%>

 <div class="bodyBack"></div>
<section class="navbar">
      <navbar>
        <div class="logo"><img src="./resources/srmap logo.png" alt="" /></div>
        <div class="options">
          <ul>
            <li><a href="./index.jsp">Home</a></li>
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
    

