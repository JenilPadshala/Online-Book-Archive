<!--getting message from Session-->
<%
    String message = (String)session.getAttribute("message");
    if(message=="Invalid Details!!"){
        //prints
    

%>
<div class="message1 mess red"><%=message%></div>

<%  session.removeAttribute("message");
 }
else if(message=="Registration Successful!"){
    
    
    
%>
<div class="message1 mess"><%=message%></div>
<%  session.removeAttribute("message");
}
else if(message!=null){

%>
<div class="message1"><%=message%></div>
<%  session.removeAttribute("message");
    }
%>


