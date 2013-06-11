$(document).ready(function() {
  $('.ajax-modal').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    $('#modal_content').load(url, function(data) {
      $('#my_modal').modal();
    });
  });
});
