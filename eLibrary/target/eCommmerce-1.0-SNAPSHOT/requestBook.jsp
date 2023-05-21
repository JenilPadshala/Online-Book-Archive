<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Request Book</title>
 <link rel="stylesheet" href="./css/contactUs.css">
 <link rel="preconnect" href="https://fonts.googleapis.com">
 <link rel="stylesheet" href="./css/index.css">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
</head>
<body>
     
    <%@include file="components/navbar.jsp"%>





  <div class="RequestForm">
   <p class="form-title">Request Book<p>
   <p class="disc">Please fill up the form below to Request a Book.We will inform you as soon as the book is available</p>
   <form action="mailto:yatharth_tomar@srmap.edu.in" method="POST">
    <div class="left-row">
     <div class="labels">
       <p class="form-labels">Book Name:</p>
     <input type="text" name="Book" class="request-input">
     </div>
    <div class="labels">
     <p class="form-labels">Author:</p>
     <input type="text" name="Author"class="request-input">
    </div>
    </div>
     
    <div class="right-row">
     <div class="labels">
        <p class="form-labels">Email Id:</p>
     <input type="email" name="ID" class="request-input">
     </div>
     <div class="labels">
      <p class="form-labels">Phone/Mobile</p>
     <input type="text" name="Phone" class="request-input">
     </div>
     
     <button type="submit" class="myButton">Submit</button>
    </div>
   </form>
  </div>
  </div>
</body>
</html>


