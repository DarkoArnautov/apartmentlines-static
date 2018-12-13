$(function() {
  $( "#primary-links-mobile" ).change(function() {
    var path = $(this).val();
    if (path) {
      window.location = path;
    }
  });
});
