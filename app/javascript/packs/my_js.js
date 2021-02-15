const letters = document.querySelectorAll('#letter-box');
const userInput = document.querySelector('#userInput');

letters.forEach(letter => {
  letter.addEventListener('click', (event) =>{
    userInput.value += letter.innerText.trim();
  });
});
