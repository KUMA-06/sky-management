function dinner() {
  let dinnerArray = [];
  const dinner = document.getElementsByClassName('dinner');
  const dinnerCount = document.getElementsByClassName('dinner-count');
  for (var i = 0; i < dinner.length; i++){
    dinner[i].addEventListener("click", () => {
      dinnerArray.push('あ');
      console.log(dinnerArray.length);
      for (var i = 0; i < dinnerCount.length; i++) {
        dinnerCount[i].innerHTML = (dinnerArray.length);
      };
    });
  };
};

window.addEventListener('turbolinks:load', dinner);