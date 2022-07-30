const editButton = document.getElementById("edits");

editButton.addEventListener("click", () => {
  makeEdits();
});

const makeEdits = () => {
  document.body.style.background = "#17a7ff";
  let sloganed = document.getElementsByClassName("slogancontent");
  sloganed[0].textContent = 'We will DESTROY YOU' 
  let coreValues = document.getElementsByClassName("value1")
  coreValues[0].textContent = ""
};
