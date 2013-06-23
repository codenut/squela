$(document).ready(function() {
  ajax_modal();
});
function ajax_modal() {
  $('.ajax-modal').click(function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    $('#modal_content').load(url, function(data) {
      $('#my_modal').modal().css({width: 'auto', height: 'auto', 'max-height': '100%'});
    });
    return false;
  });
}
