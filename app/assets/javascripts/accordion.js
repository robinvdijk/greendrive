$(document).ready(function(){
 
	$('#accordion').find('h4').click( function(e){ 
		e.preventDefault();		
		$(this).next().slideToggle('fast');			
	});
 
});