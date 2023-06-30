//= require jquery
//= require jquery_ujs


$(document).ready(function() {
  $('.open-pdf-link').on('click', function(e) {
    e.preventDefault();
    var pdfUrl = $(this).attr('href');
    window.location.href = pdfUrl;
  });
});
