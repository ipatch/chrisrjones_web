// NOTE: ipatch, my attempt to create a vanilla JS navbar ie. no bootstrap
//
document.addEventListener('DOMContentLoaded', function() {
  const navbarToggle = document.getElementById('navbar-toggle');
  const navbarMenu = document.getElementById('navbar-menu');
  const dropdownToggle = document.querySelector('.dropdown-toggle');
  const dropdownMenu = document.querySelector('.dropdown-menu');

  navbarToggle.addEventListener('click', function() {
    navbarMenu.classList.toggle('show');
  });

  dropdownToggle.addEventListener('click', function(event) {
    event.preventDefault();
    dropdownMenu.classList.toggle('show');
  });

  // For dropdown, close the menu if the user clicks outside
  document.addEventListener('click', function(event) {
    if (!dropdownMenu.contains(event.target)) {
      dropdownMenu.classList.remove('show');
    }
  });
});
