  // Load the Visualization API library and the piechart library.
  google.load('visualization', '1.0', {'packages':['corechart']});
  google.setOnLoadCallback(drawChart);
     // ... draw the chart...
	 
   function drawChart() {

	   var car_miles = $('#chart_div1').data('car_miles');
		 var car_miles_week = $('#chart_div2').data('car_miles_week');
		 var car_miles_month = $('#chart_div3').data('car_miles_month');
		 var car_miles_year = $('#chart_div4').data('car_miles_year');
     
		 // Create the data table.
     var data = new google.visualization.DataTable();
	     data.addColumn('string', 'Ratio');    
	     data.addColumn('number', 'Slices');
	     data.addRows([
	       ['Elektrisch', car_miles.electric],
	       ['Fossiel', car_miles.fossile],
				 ['Empty', 0]                 
     	 ]);
			 
     var data2 = new google.visualization.DataTable();
	     data2.addColumn('string', 'Ratio');    
	     data2.addColumn('number', 'Slices');
	     data2.addRows([
	       ['Elektrisch', car_miles_week.electric],
	       ['Fossiel', car_miles_week.fossile],
				 ['Empty', 0]                 
     	 ]);
			 
     var data3 = new google.visualization.DataTable();
	     data3.addColumn('string', 'Ratio');    
	     data3.addColumn('number', 'Slices');
	     data3.addRows([
	       ['Elektrisch', car_miles_month.electric],
	       ['Fossiel', car_miles_month.fossile],
				 ['Empty', 0]                 
     	 ]);
			 
     var data4 = new google.visualization.DataTable();
	     data4.addColumn('string', 'Ratio');    
	     data4.addColumn('number', 'Slices');
	     data4.addRows([
	       ['Elektrisch', car_miles_year.electric],
	       ['Fossiel', car_miles_year.fossile],
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
					0: {color: '#48b237'}, 
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
     var chart = new google.visualization.PieChart(document.getElementById('chart_div4'));
     chart.draw(data4, options);
   }

