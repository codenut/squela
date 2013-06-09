$(document).ready(function() {
  $('[data-toggle="modal"]').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    $('#modal_div').load(url, function(data) {
      $(data).modal();
    });
  });
});
