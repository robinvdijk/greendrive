$(document).ready(function()
      {  
				
         $("#button_all").click(function() {
			   $("#general, #green, #divers").show()
         }); 
				
         $("#button_green").click(function() {
				 $("#green").show()
         $("#general, #divers").hide()
			 	 });
				 
         $("#button_general").click(function() {
				 $("#general").show()
         $("#green, #divers").hide()
         });  
				 
         $("#button_divers").click(function() {
				 $("#divers").show()
         $("#green, #general").hide()
         }); 
				 
});


