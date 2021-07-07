window.draw_graph = -> 
    ctx = document.getElementById("myChart").getContext('2d')
    barNum = gon.first.length
    labels = new Array(barNum)
    bgColors = new Array(barNum)
    bdColors = new Array(barNum)
    for i in [0...barNum]
        labels[i] = gon.dates[i]
        bgColors[i] = 'rgba(75, 192, 192, 0.2)'
        bdColors[i] = 'rgba(75, 192, 192, 1)'
    myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: '# of Votes',
                data: gon.first,
                backgroundColor: [
                    bgColors
                ],
                borderColor: [
                    bgColors
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    })
