$(document).ready(function(){ 
				
				
         $("#all").click(function() {
			   $("#all_date").show()
				 $("#week_date").hide()
         }); 
				
         $("#week").click(function() {
				 $("#week_date, #chart_div2").show()
         $("#all_date").hide()
			 	 });
});


