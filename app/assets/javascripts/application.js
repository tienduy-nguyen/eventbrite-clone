window.onclick = function (event) {
  openCloseDropdown(event);
};

function closeAllDropdown() {
  let dropdowns = document.getElementsByClassName('dropdown-expand');
  for (let item of dropdowns) {
    item.classList.remove('dropdown-expand');
  }
}

function openCloseDropdown(event) {
  if (!event.target.matches('.dropdown-toggle')) {
    // Close dropdown when click out of dropdown menu
    closeAllDropdown();
  } else {
    let toggle = event.target.dataset.toggle;
    let content = document.getElementById(toggle);
    if (content.classList.contains('dropdown-expand')) {
      closeAllDropdown();
    } else {
      closeAllDropdown();
      content.classList.add('dropdown-expand');
    }
  }
}
