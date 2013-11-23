$(function(){
  $('#post_response_link').on('ajax:success', function(e, data, status, xhr){
    $('#new_response')[0].innerHTML = data
    listenForNewResponse()
  })

  $('.up_vote').on('ajax:success', function(e, data, status, xhr){
    console.log('up_vote')
    $(this).parent().find('span.response_votes')[0].innerText = data['new_total']
    $(this).toggleClass('clicked')
    $('.down_vote').removeClass('clicked')
    $('.up_vote img')[0].src="/assets/up_clicked.png"
    $('.down_vote img')[0].src="/assets/down.png"
  })

  $('.down_vote').on('ajax:success', function(e, data, status, xhr){
    console.log('down_vote')
    $(this).parent().find('span.response_votes')[0].innerText = data['new_total']
    $(this).toggleClass('clicked')
    $('.up_vote').removeClass('clicked')
    $('.down_vote img')[0].src="/assets/down_clicked.png"
    $('.up_vote img')[0].src="/assets/up.png"
  })
})


function listenForNewResponse(){
  $('form#new_response').on('ajax:success', function(e, data, status, xhr){
    $('#new_response').append(data)
    $('#new_response_form')[0].innerHTML = 'Response submitted.'
    $('#new_response_form').delay(2000).fadeOut()
  })
}
