$(function(){
  $('#post_response_link').on('ajax:success', function(e, data, status, xhr){
    $('#new_response')[0].innerHTML = data
    listenForNewResponse()
  })

  $('.up_vote').on('ajax:success', function(e, data, status, xhr){
    console.log('up_vote')
    $(this).parent().find('span.response_votes')[0].innerText = data['new_total']
    console.log(data['new_total'])
  })
})


function listenForNewResponse(){
  $('form#new_response').on('ajax:success', function(e, data, status, xhr){
    $('#new_response').append(data)
    $('#new_response_form')[0].innerHTML = 'Response submitted.'
    $('#new_response_form').delay(2000).fadeOut()
  })
}
