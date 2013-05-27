$(document).ready(function() {

	var hl = 'highlight';	
	var hlc = 'highlightcenter';
	// var next = $(".button:contains(Volgende)");	
	// var prev = $(".button:contains(Vorige)");


	//--------------------First--Page--Trigger-----------
	$('#help').on('click', 'img', function(){ 
		$('#blanket, #tutorial_1').slideToggle(800); 
	});
	//--------------------First--Page--------------------
	$('#tutorial_1').on('click', '.next', function(){ 
		$('#tutorial_1').toggle();
		$('#tutorial_2').fadeIn(800);
		// $('#tutorial_2').animate({'margin-left': '100px'});
		$('#profile').toggleClass(hl); 
	});
	//--------------------Second--Page-------------------
	$('#tutorial_2').on('click', '.prev', function(){
		$('#tutorial_1').slideToggle(800);
		$('#tutorial_2').toggle();
		$('#profile').toggleClass(hl);
	});
		
	$('#tutorial_2 ').on('click', '.next', function(){ 
		$('#tutorial_2').toggle();
		$('#chart').toggleClass(hl);
		$('#profile').toggleClass(hl);
		$('#chart_div:after').toggleClass(hlc);
	});
	//--------------------Third--Page-------------------
	
	
});







	


