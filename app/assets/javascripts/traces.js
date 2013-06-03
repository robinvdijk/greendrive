
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

	   var car_miles = $('#chart_div1').data('car_miles');
		 var car_miles_week = $('#chart_div2').data('car_miles_week');
		 var car_miles_month = $('#chart_div3').data('car_miles_month');

     // Create the data table.
     var data = new google.visualization.DataTable();
	     data.addColumn('string', 'Ratio');    
	     data.addColumn('number', 'Slices');
	     data.addRows([
	       ['Electric', car_miles.electric],
	       ['Fossile', car_miles.fossile],
				 ['Empty', 0]                 
     	 ]);
			 
     var data2 = new google.visualization.DataTable();
	     data2.addColumn('string', 'Ratio');    
	     data2.addColumn('number', 'Slices');
	     data2.addRows([
	       ['Electric', car_miles_week.electric],
	       ['Fossile', car_miles_week.fossile],
				 ['Empty', 0]                 
     	 ]);
			 
     var data3 = new google.visualization.DataTable();
	     data3.addColumn('string', 'Ratio');    
	     data3.addColumn('number', 'Slices');
	     data3.addRows([
	       ['Electric', car_miles_month.electric],
	       ['Fossile', car_miles_month.fossile],
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
     var chart = new google.visualization.PieChart(document.getElementById('chart_div1'));
     chart.draw(data, options);
     var chart = new google.visualization.PieChart(document.getElementById('chart_div2'));
     chart.draw(data2, options);
     var chart = new google.visualization.PieChart(document.getElementById('chart_div3'));
     chart.draw(data3, options);
   }

