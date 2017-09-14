$(document).ready(function(){
  if($('div').is('#container')){
  $.ajax({
    type: 'GET',
    url: `/api/v1/contestants/${$('.contestant_information').data('id')}/weekly_points`,
    success: function(data) {
      var points = []
      $.each(data, function (index, dataItem) {
          points.push(dataItem.points)
      })

      Highcharts.setOptions({
          chart: {
              style: {
                  fontFamily: 'Quicksand'
              }
          }
      });

      Highcharts.chart('container', {
        chart: {
            type: 'spline'
        },

          title: {
              text: `${$('.contestant_information').data('name')}'s Points this Season`
          },

          yAxis: {
             title: {
                 text: "Points"
             }},

         xAxis: {
            title: {
                text: "Week"
            }},

        credits: {
            enabled: false
        },

          plotOptions: {
              series: {
                  pointStart: 1
              }
          },

          legend: {
               enabled: false
           },

          series: [{
              name: 'Points',
              data: points
          }]

      });
     }
   });
 }
 });
