$(document).ready(function(){
  if($('div').is('#team-chart')){
  $.ajax({
    type: 'GET',
    url: `/api/v1/leagues/${$('.league_information').data('id')}/team_points`,
    success: function(result) {
      var chart_data = []
      $.each(result, function (index, dataItem) {
          chart_data.push({name: dataItem.name, data: dataItem.points})
      })

      Highcharts.setOptions({
          chart: {
              style: {
                  fontFamily: 'Quicksand'
              }
          }
      });

      Highcharts.chart('team-chart', {
        chart: {
            type: 'spline'
        },

          title: {
              text: "Week by Week"
          },

          yAxis: {
              min: 0,
              max: 150,
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
               enabled: true
           },

          series: chart_data

      });
     }
   });
 }
 });
