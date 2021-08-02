function dinner() {
  let dinnerArray = ['あ', 'い', 'う'];
  const dinner = document.getElementById('dinner');
  dinner.addEventListener("click", () => {
    dinnerArray.push('え');
    console.log(dinnerArray.length);
    const dinnerCount = document.getElementById('dinner-count');
    dinnerCount.innerHTML = (dinnerArray.length);
  });
};

window.addEventListener('turbolinks:load', dinner);