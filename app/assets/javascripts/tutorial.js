$(document).ready(function() {

	var hl = 'highlight';	
	
	// var next = $(".button:contains(Volgende)");	
	// var prev = $(".button:contains(Vorige)");


	//--------------------First--Page--Trigger-----------
	$('#new_car .button').click(function(){ 
		window.location = '/users';
		$('#new_car').toggle();
		$('#blanket').toggle();		
		$('#tutorial_1').slideToggle(800); 
	});
	
	$('#help').on('click', function(){ 
		$('#blanket').toggle();		
		$('#tutorial_1').slideToggle(800); 
	});
	//--------------------First--Page--------------------
	$('#tutorial_1').on('click', '.next', function(){ 
		$('#tutorial_1').toggle();
		$('#profile').toggleClass(hl).animate({ opacity:1 }, 800);
		$('#tutorial_2').show().animate({ right:'45%' }, 800);
	});

	//--------------------Second--Page-------------------
	$('#tutorial_2').on('click', '.prev', function(){
		$('#tutorial_1').slideToggle(800);
		$('#tutorial_2').hide();
		$('#profile').toggleClass(hl)
	});
	
	$('#tutorial_2 ').on('click', '.next', function(){ 
		$('#tutorial_2').toggle();
		$('#tutorial_3').toggle();
		$('#tutorial_3').show().animate({ left:'72%' }, 800);
		$('#chart').toggleClass(hl).animate({ opacity:1 }, 800);
		$('#profile').toggleClass(hl)
	});
	// //--------------------Third--Page-------------------
	$('#tutorial_3').on('click', '.prev', function(){
		$('#tutorial_2').toggle();
		$('#tutorial_3').toggle();
		$('#chart').toggleClass(hl)
		$('#profile').toggleClass(hl)
	});
	
	$('#tutorial_3 ').on('click', '.next', function(){ 
		$('#tutorial_3').toggle();
		$('#chart').toggleClass();
		$('#tutorial_4').toggle().animate({ right:'35.6%' }, 800);
		$('#tutorial_5').toggle().animate({ left:'67.7%' }, 800);
		$('#tutorial_6').toggle().animate({ left:'80.8%' }, 800);
		$('#badges').toggleClass(hl).animate({ opacity:1 }, 800);
		$('.nav_dashboard').toggleClass(hl).animate({ opacity:1 }, 800);
		$('#buttons').toggleClass();	
	});
	// //--------------------Fourth--Page-------------------
	$('#tutorial_6').on('click', '.prev', function(){
		$('#tutorial_3').toggle();
		$('#chart').toggleClass();
		$('#tutorial_4').toggle();
		$('#tutorial_5').toggle();
		$('#tutorial_6').toggle();
		$('.nav_dashboard').toggleClass(hl);
		$('#badges').toggleClass(hl);
	});
	
	$('#tutorial_6').on('click', '.next', function(){
		$('#tutorial_4').toggle();
		$('#tutorial_5').toggle();
		$('#tutorial_6').toggle();		
		$('.nav_dashboard').toggleClass(hl);
		$('#badges').toggleClass(hl);
		$('#blanket').toggle();	
	});
	
});







	


