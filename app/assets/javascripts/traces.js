
// // select all desired input fields and attach tooltips to them
//       $("#myform :input").tip({
//  
//       // place tooltip on the right edge
//       position: "center right",
//  
//       // a little tweaking of the position
//       offset: [-2, 10],
//  
//       // use the built-in fadeIn/fadeOut effect
//       effect: "fade",
//  
//       // custom opacity setting
//       opacity: 0.7
//  
//       });

  // Load the Visualization API library and the piechart library.
  google.load('visualization', '1.0', {'packages':['corechart']});
  google.setOnLoadCallback(drawChart);
     // ... draw the chart...
	 
   function drawChart() {
		 
	   var car_miles = $('#chart_div').data('car_miles');

     // Create the data table.
     var data = new google.visualization.DataTable();
	     data.addColumn('string', 'Ratio');    
	     data.addColumn('number', 'Slices');
	     data.addRows([
	       ['Electric', car_miles.electric],
	       ['Fossile', car_miles.fossile],
				 ['Empty', 0]                 
     	 ]);

     // Set chart options
     var options = {
	        width:400,
	        height:400,
			 legend: {
			 		position: 'none'
			 },
			 pieHole: 0.65,
			 pieSliceText: 'none',
			 slices: {
					0: {color: '#39b54a'}, 
					1: {color: '#006837'}, 
					2: {color: '#808080'}
			 },
			 backgroundColor:	{
			 		fill: 'none'
			 }
		};
					
     // Instantiate and draw our chart, passing in some options.
     var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
     chart.draw(data, options);
             
   }

