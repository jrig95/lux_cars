const toggle = () => {
  let links = document.getElementById('dropdown_links');
  links.classList.toggle("show")
  console.log("click")
}
const dropDown = () => {
 let button = document.getElementById('dropdown');

  button.addEventListener("click", toggle);

}

export {dropDown}
