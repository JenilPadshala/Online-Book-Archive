/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const signupBtn = document.querySelector('.signupBtn');
const loginBtn = document.querySelector('.loginBtn');
const moveBtn = document.querySelector('.moveBtn');
const login = document.querySelector('.login');
const signup = document.querySelector('.signup');

loginBtn.addEventListener('click', () => {
  moveBtn.classList.add('rightBtn');
  login.classList.add('loginform');
  signup.classList.remove('signupform');
  moveBtn.innerHTML = 'Login';
});
signupBtn.addEventListener('click', () => {
  moveBtn.classList.remove('rightBtn');
  signup.classList.add('signupform');
  login.classList.remove('loginform');
  moveBtn.innerHTML = 'Signup';
});
