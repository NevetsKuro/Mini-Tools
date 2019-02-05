<html><head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <title>Highcharts Demo</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta name="robots" content="noindex, nofollow">
  <meta name="googlebot" content="noindex, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
    <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0px auto; overflow: hidden;"></div>

>

<script type="text/javascript">

// Radialize the colors
Highcharts.setOptions({
    colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
        return {
            radialGradient: {
                cx: 0.5,
                cy: 0.3,
                r: 0.7
            },
            stops: [
                [0, color],
                [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
            ]
        };
    })
});

// Build the chart
Highcharts.chart('container', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: 'Browser market shares in January, 2018'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.0f}</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}<br>(<label>Date</label>:{point.date})</b>',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
                    font:'12px arial, monospace;'
                },
                connectorColor: 'silver'
            }
        }
    },
    series: [{
        name: 'Total_Notifications',
        data: [
            {name: "RASHTRIYA ISPAT NIGAM LIMITED", y: 12, date:"16-05-17", color: '#FF0000'},
            {name: "RASHTRIYA ISPAT NIGAM LIMITED", y: 12, date: "09-06-17", color: '#FF0000'},
            {name: "RASHTRIYA ISPAT NIGAM LIMITED", y: 3, date: "19-05-17", color: '#FF0000'},
            {name: "StevenFernz", y: 4, date: "16-05-17", color: '#FF00AA'},
            {name: "MintuChauhan", y: 8, date: "09-06-17", color: '#FFA0CC'},
            {name: "StevenFernz", y: 15, date: "09-06-17", color: '#FF00AA'}
        ]
    }]
});


</script>


</body></html>