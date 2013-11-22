$(function(){

  $('#post_response_link').on('ajax:success', function(e, data, status, xhr){
    $('#new_response')[0].innerHTML = data
  })


})

