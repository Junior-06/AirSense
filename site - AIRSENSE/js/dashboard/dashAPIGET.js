var sensorUmi = new Chart(document.getElementById('grafico-umidade').getContext('2d'), {
    type: 'line',
    data: {
        datasets: [{
            label: 'Umidade',
            borderColor: '#63B1BC',
            backgroundColor: '#0096FF'
        },]
    },
    options: {
        scales: {
            x: {
                beginAtZero: true
            },
            y: {
                title: {
                    display: true,
                    text: '(%)'
                },
                beginAtZero: true,
            },
        },
    }
});

var sensorTemp = new Chart(document.getElementById('grafico-temperatura').getContext('2d'), {
    type: 'line',
    data: {
        datasets: [{
            label: 'Temperatura',
            borderColor: '#63B1BC',
            backgroundColor: '#ED145B'
        }]
    },
    options: {
        scales: {
            x: {
                beginAtZero: true
            },
            y: {
                title: {
                    display: true,
                    text: '(0-1)'
                },
                beginAtZero: true
            }
        }
    }
});

var paginacao = {};
var tempo = {};
var maxRequest = 0

function obterDados(grafico, endpoint) {
    fetch('http://localhost:3300/sensores/' + endpoint)
        .then(response => response.json())
        .then(valores => {
            if (paginacao[endpoint] == null) {
                paginacao[endpoint] = 0;
            }
            if (tempo[endpoint] == null) {
                tempo[endpoint] = 0;
            }

            var ultimaPaginacao = paginacao[endpoint];
            paginacao[endpoint] = valores.length;
            valores = valores.slice(ultimaPaginacao);
            console.log(valores);

            valores.forEach((valor) => {
                if (grafico.data.labels.length == 10 && grafico.data.datasets[0].data.length == 10) {
                    grafico.data.labels.shift();
                    grafico.data.datasets[0].data.shift();
                }

                grafico.data.labels.push(tempo[endpoint]++);
                grafico.data.datasets[0].data.push(parseFloat(valor));
                grafico.update();
            });
        })
        .catch(error => {console.error('Erro ao obter dados:', error); maxRequest++} );
}


if(maxRequest <= 10){
    setInterval(() => {
        obterDados(sensorTemp,'temperatura');
        obterDados(sensorUmi,'umidade');
    }, 1000);
}
