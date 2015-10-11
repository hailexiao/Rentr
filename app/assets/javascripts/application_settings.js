$(document).ready(function() {
  setTimeout(function(){
    $(".alert-box").slideUp("slow", function() {
      $(this).remove();
    })
  }, 4500);
});
