const update = document.querySelectorAll('.update');
console.log(update);
const form2 = document.querySelector('.popup2');
const close2 = document.querySelector('.addBook');
console.log(form2);
const del=document.querySelectorAll(".delete");
console.log(del);

        
del.forEach((btn)=>{
    btn.addEventListener("click",()=>{
    const con=confirm("Want to delete this Book ?");
    if(con){
        const url = btn.getAttribute("url");
        console.log(url);
        document.location.href=url;  
        const alarm=alert("Book Deleted! click Ok to continue");
        if(alarm){
           document.location.href="adminBooks.jsp";   
        }
          document.location.href="adminBooks.jsp";  
    }
    else{
        document.location.href="adminBooks.jsp";
        
    }
    
   
    
   
});
});

update.forEach((user)=>user.addEventListener('click', () => {
  form2.classList.toggle('active');
}));
close2.addEventListener('click', () => {
  form2.classList.toggle('active');
});
