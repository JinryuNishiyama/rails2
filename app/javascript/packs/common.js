/* global $ */
$(document).on("turbolinks:load", function(){
  $(".header-icon").click(function(){
    $(".header-menu-box").toggle();
  });
});
