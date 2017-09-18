$(document).ready(function(){
  if($('div').is('#team-chart')){
  // $.ajax({
  //   type: 'GET',
  //   url: `/api/v1/contestants/${$('.contestant_information').data('id')}/weekly_points`,
  //   success: function(data) {
  //     var points = []
  //     $.each(data, function (index, dataItem) {
  //         points.push(dataItem.points)
  //     })

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
              name: 'Team 1',
              data: [1,6,7,2]
          },
          {
              name: 'Team 2',
              data: [5,2,6,1]
          },
          {
              name: 'Team 3',
              data: [1,5,7,2,5,2,6,1,5,2,6,1]
          }]

      });
  //    }
  //  });
 }
 });
