$(function(){
  $('#post_response_link').on('ajax:success', function(e, data, status, xhr){
    $('#new_response')[0].innerHTML = data
    listenForNewResponse()
  })
})


function listenForNewResponse(){
  $('form#new_response').on('ajax:success', function(e, data, status, xhr){
    console.log(data, status)
    $('#new_response').append(data)
    $('#new_response_form')[0].innerHTML = 'Response submitted.'
    $('#new_response_form').delay(2000).fadeOut()
  })
}
