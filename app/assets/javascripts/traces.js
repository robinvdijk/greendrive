  // Load the Visualization API library and the piechart library.
  google.load('visualization', '1.0', {'packages':['corechart']});
  google.setOnLoadCallback(drawChart);
     // ... draw the chart...
	 
   function drawChart() {
		  
	   var miles = $('#chart_div').data('miles');
		 
		 var battery = $('#chart_div3').data('battery');
		 
		 var points = $('#chart_div4').data('points');

               // Create the data table.
               var data = new google.visualization.DataTable();
               data.addColumn('string', 'Ratio');    
               data.addColumn('number', 'Slices');
               data.addRows([
                 ['Electric', miles.electric],
                 ['Fossile', miles.fossile],
								 ['Empty', 0]
	                 
               ]);
				   
               var data2 = new google.visualization.arrayToDataTable([
                 ['Ratio','Electric', 'Fossile', 'Empty'],
                 ['', miles.electric, miles.fossile, 	0],
								 ['', miles.electric, 0, 							(miles.electric + miles.fossile) - miles.electric],
								 ['', 0, 							miles.fossile,	(miles.electric + miles.fossile) - miles.fossile]  
								     
               ]);
               // Create the data table.

               var data3 = new google.visualization.DataTable();
               data3.addColumn('string', 'Week');
               data3.addColumn('number', 'Battery Value');
               data3.addRows([
                 [battery.created_at, battery.battery_value],
								 [battery.created_at, 4],
								 [battery.created_at, 6],
								 [battery.created_at, 1],
								 [battery.created_at, 3]

	          
               ]);
							 
               // Set chart options
             var options = {
							 title:'Ratio of Fuel',
               width:400,
               height:300,
							 legend: {
							 		position: 'none'
							 },
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
															
               // Set chart options
               var options2 = {	 
								title:'Ratio of Fuel',
                width:400,
                height:300,
								series: {
									0: {color:'#39b54a'},
									1: {color: '#006837'}, 
									2: {color: '#808080'}},
								bar: {
									groupWidth: 40
								},
						  	isStacked: true,
 							 backgroundColor:	{
 								  fill: 'none'
 							 }
							 };
							 
               // Set chart options
               var options3 = {
								 title:'Battery',
                 width:400,
                 height:300
							 };
							 
               var options4 = {	 
       								title:'Points',
                width:600,
                height:80,
       								series: {
       									0: {color:'#39b54a'},
       									1: {color: '#808080'}},
       								bar: {
       									groupWidth: 15
       								},
       						  	isStacked: true,
        							 legend: {
        							 		position: 'none'
        							 },
        							 backgroundColor:	{
        								  fill: 'none'
        							 }
       							 };

               // Instantiate and draw our chart, passing in some options.
               var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
               chart.draw(data, options);
               var chart2 = new google.visualization.BarChart(document.getElementById('chart_div2'));
               chart2.draw(data2, options2);
               var chart3 = new google.visualization.ColumnChart(document.getElementById('chart_div3'));
               chart3.draw(data2, options2);
               var chart4 = new google.visualization.BarChart(document.getElementById('chart_div4'));
               chart4.draw(data4, options4);
             }