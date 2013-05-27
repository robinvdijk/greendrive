$(document).ready(function() {

	var hl = 'highlight';	
	// var next = $(".button:contains(Volgende)");	
	// var prev = $(".button:contains(Vorige)");


	//--------------------First--Page--Trigger-----------
	$('#help').on('click', 'img', function(){ 
		$('#blanket, #tutorial_1').fadeToggle(); 
	});
	//--------------------First--Page--------------------
	$('#tutorial_1').on('click', '.next', function(){ 
		$('#tutorial_1').toggle();
		$('#tutorial_2').fadeToggle();
		$('#profile').fadeIn().toggleClass(hl); 
	});
	//--------------------Second--Page-------------------
	$('#tutorial_2').on('click', '.prev', function(){
		$('#tutorial_2, #tutorial_1').fadeToggle();
		$('#profile').toggleClass(hl);
	});
		
	$('#tutorial_2 ').on('click', '.next', function(){ 
		$('#tutorial_2').toggle();
		$('#badges').toggleClass(hl);
		$('#profile').toggleClass(hl);
	});
	//--------------------Third--Page-------------------
	
	
});







	


