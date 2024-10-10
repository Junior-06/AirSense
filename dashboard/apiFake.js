const express = require('express');

const SERVIDOR_PORTA = 3300;

const serial = async (
    valoresSensorDHT11,
    valoresSensorLM35,
) => {
    setInterval(() => {
        const temperatura = parseInt(Math.random() * 41).toString();
        const umidade = parseFloat(Math.random() * 40 + 1).toString();

        valoresSensorLM35.push(temperatura);
        valoresSensorDHT11.push(umidade);

        console.log('Temperatura:', temperatura, '°C, Umidade:', umidade, '%');
    }, 1000);
}

const servidor = (
    valoresSensorDHT11,
    valoresSensorLM35
) => {
    const app = express();

    // configurações de requisição e resposta
    app.use((request, response, next) => {
        response.header('Access-Control-Allow-Origin', '*');
        response.header('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept');
        next();
    });

    // inicia o servidor na porta especificada
    app.listen(SERVIDOR_PORTA, () => {
        console.log(`API executada com sucesso na porta ${SERVIDOR_PORTA}`);
    });

    // define os endpoints da API para cada tipo de sensor
    app.get('/sensores/umidade', (_, response) => {
        return response.json(valoresSensorDHT11);
    });
    app.get('/sensores/temperatura', (_, response) => {
        return response.json(valoresSensorLM35);
    });
}

// função principal assíncrona para iniciar a comunicação serial e o servidor web
(async () => {
    // arrays para armazenar os valores dos sensores
    const valoresSensorDHT11 = [];
    const valoresSensorLM35 = [];

    // inicia a comunicação serial
    await serial(
        valoresSensorDHT11,
        valoresSensorLM35
    );

    // inicia o servidor web
    servidor(
        valoresSensorDHT11,
        valoresSensorLM35
    );
})();