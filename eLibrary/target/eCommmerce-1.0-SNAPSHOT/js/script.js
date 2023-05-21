const hamburger = document.querySelector('.hamburger');
const options = document.querySelector('.options');
// console.log(hamburger);
// console.log(options);
hamburger.addEventListener('click', () => {
  hamburger.classList.toggle('active');
  options.classList.toggle('active');
});

// var x = document.querySelector('.login');
// var y = document.querySelector('.register');
// var z = document.querySelector('#btn-color');
// console.log(x);
// console.log(y);
// console.log(z);
// function register() {
//   x.style.left = '-800px';
//   y.style.left = '570px';
//   z.style.left = '70px';
// }
// function login() {
//   x.style.left = '0';
//   y.style.left = '0';
//   z.style.left = '-12px';
// }
const productContainers = [...document.querySelectorAll('.product-container')];
const nxtBtn = [...document.querySelectorAll('.nxt-btn')];
const preBtn = [...document.querySelectorAll('.pre-btn')];

productContainers.forEach((item, i) => {
  let containerDimensions = item.getBoundingClientRect();
  let containerWidth = containerDimensions.width;

  nxtBtn[i].addEventListener('click', () => {
    item.scrollLeft += containerWidth;
  });

  preBtn[i].addEventListener('click', () => {
    item.scrollLeft -= containerWidth;
  });
});
