const form = document.querySelector('.popup');
console.log(form);
const addCategory = document.querySelector('.third');
const close = document.querySelector('.addCategory');
console.log(addCategory);
const form2 = document.querySelector('.popup2');
console.log(form2);
const addBook = document.querySelector('.fourth');
console.log(addBook);
const close2 = document.querySelector('.addBook');
console.log(addCategory);
addCategory.addEventListener('click', () => {
  form.classList.toggle('active');
});
close.addEventListener('click', () => {
  form.classList.remove('active');
});
addBook.addEventListener('click', () => {
  form2.classList.toggle('active');
});
close2.addEventListener('click', () => {
  form2.classList.remove('active');
});
