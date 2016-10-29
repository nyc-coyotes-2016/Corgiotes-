$(document).ready(function() {
  alert('hey');
  $(".button-collapse").click(function(event) {
    event.preventDefault();
    $(this).sideNav();
  })
});
