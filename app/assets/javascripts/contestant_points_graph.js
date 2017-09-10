$(document).ready(function(){
  $.ajax({
    type: 'GET',
    url: '/api/v1/contestants/1/weekly_points',
    success: function(data) {
      Highcharts.chart('container', {
       chart: {
           type: 'bar'
       },
       title: {
           text: 'Fruit Consumption'
       },
       xAxis: {
           categories: ['Apples', 'Bananas', 'Oranges']
       },
       yAxis: {
           title: {
               text: 'Fruit eaten'
           }
       },
       series: [{
           name: 'Jane',
           data: [1, 0, 4]
       }, {
           name: 'John',
           data: [5, 7, 3]
       }]
   });
     }
   });
 });
