const turnOnApi = true
var temperaturas = [20,21,22,20,19,20,18,19,20]
var umidades      = [18,17,18,18,18,19,20,19,18]
if(turnOnApi){
temperaturas = []
umidades = []
}


var sensorUmi = new Chart(document.getElementById('grafico-umidade').getContext('2d'), {
    type: 'bar',
    data: {
        labels: ['16:01','16:02','16:03','16:04','16:05','16:06','16:07','16:08','16:09'],
        datasets: [{
            label: 'Umidade',
            borderColor: '#63B1BC',
            backgroundColor: '#0096FF',
            data: umidades
        },]
    },
    options: {
        scales: {
            x: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Horário de Monitoramento'
                }
            },
            y: {
                title: {
                    display: true,
                    text: 'Umidade (%)',
                },
                suggestedMin: 0,
                suggestedMax: 100
            },
        },
        plugins:{
            annotation: {
                annotations: {
                    limiteSuperior: {
                        type: 'line',
                        yMin: 40,
                        yMax: 40,
                        borderColor: 'red',
                        borderWidth: 2
                    }
                }
            }
        }
    }
});

var sensorTemp = new Chart(document.getElementById('grafico-temperatura').getContext('2d'), {
    type: 'line',
    data: {
        labels: ['16:01','16:02','16:03','16:04','16:05','16:06','16:07','16:08','16:09'],
        datasets: [{
            label: 'Temperatura',
            borderColor: '#63B1BC',
            backgroundColor: '#ED145B',
            data: temperaturas
        }]
    },
    options: {
        scales: {
            x: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Horário de Monitoramento'
                },
            },
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Temperatura C°'
                },
                suggestedMin: 0,
                suggestedMax: 45
            }
        },
        plugins:{
            annotation: {
                annotations: {
                    limiteSuperior: {
                        type: 'line',
                        yMin: 30,
                        yMax: 30,
                        borderColor: 'red',
                        borderWidth: 2
                    },
                    limiteinferior: {
                        type: 'line',
                        yMin: 10,
                        yMax: 10,
                        borderColor: 'blue',
                        borderWidth: 2
                    }
                }
            }
        }
    }
});

var paginacao = {};
var tempo = {};



function obterDados(grafico, endpoint) {
    if(turnOnApi){
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

                if(grafico == 'sensorTemp'){
                    umidades.push(valores[0])
                    umidades.pop()
                } else {
                    temperaturas.pop()
                    temperaturas.push(valores[0])
                }
    
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
}

function atualizarKPI(){
    function media(lista){
        return (lista.reduce((valorAnterior, proximoValor) => valorAnterior + proximoValor, 0)/ lista.length).toFixed(2)
    }

    function minMax(lista, especificador){
        return `${Math.max(...lista).toFixed(0)}${especificador}/${Math.min(...lista).toFixed(0)}${especificador}`
    }

    kpi_mediaTemp.innerHTML = media(temperaturas) + ' C°'
    kpi_mediaUmi.innerHTML = media(umidades) + '%'
    kpi_minMaxTemp.innerHTML = minMax(temperaturas, 'C°')
    kpi_minMaxUmi.innerHTML = minMax(umidades, '%')
}



setInterval(() => {
    obterDados(sensorTemp,'temperatura');
    obterDados(sensorUmi,'umidade');
    atualizarKPI()
}, 1000);

