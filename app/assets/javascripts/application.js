//----------------------------------------------//
// Dropdown menu
//----------------------------------------------//
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

//----------------------------------------------//
// Drag drop photo
//----------------------------------------------//
function dragNdrop(event) {
  var fileName = URL.createObjectURL(event.target.files[0]);
  var preview = document.getElementById('preview');
  var previewImg = document.createElement('img');
  previewImg.setAttribute('src', fileName);
  preview.innerHTML = '';
  preview.appendChild(previewImg);
}
function drag() {
  document.getElementById('uploadFile').parentNode.className =
    'draging dragBox';
}
function drop() {
  document.getElementById('uploadFile').parentNode.className = 'dragBox';
}
