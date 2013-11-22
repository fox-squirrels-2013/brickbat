$(document).ready(function(){
	window.setInterval(function(){
  	$.ajax({
  		url: '/check'
  	})
	}, 60000);
})