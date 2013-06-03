$(document).ready(function(){ 
				
				
         $("#all").click(function() {
			   $("#all_date").show()
				 $("#week_date, #month_date").hide()
         }); 
				
         $("#week").click(function() {
				 $("#week_date, #chart_div2").show()
         $("#all_date, #month_date").hide()
			 	 });
				 
         $("#month").click(function() {
				 $("#month_date, #chart_div3").show()
         $("#all_date, #week_date").hide()
			 	 });
});


