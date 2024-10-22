#include "DHT.h"  // Insere a biblioteca DHT.h no projeto

#define TIPO_SENSOR DHT11 // Define o tipo de sensor que será utilizado

const int PINO_SENSOR_DHT11 = A0; // Define a entrada analógica que será utilizada pelo sensor DHT11
const int PINO_SENSOR_TEMPERATURA = A2; // Define a entrada analógica que será utilizada pelo sensor LM35
float temperaturaCelsius; // Criação de uma variavel que armazenará o valor da temperatura

DHT sensorDHT(PINO_SENSOR_DHT11, TIPO_SENSOR); // Relaciona o tipo de sensor com a entrada que está sendo utilizada

// Da um start no sensor para que comece a captar as informações
void setup() {
  Serial.begin(9600);
  sensorDHT.begin();
}

// Loop de medição que se repetirá automaticamente
void loop() {
  int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA); // Armazenamento do dado da entrada analógica em uma variável
  float umidade = sensorDHT.readHumidity(); // Armaenamento do dado da entrada analógica em uma variável
  temperaturaCelsius = (valorLeitura * 5.0 / 1023.0) / 0.01; // Calculo da temperatura

  // --------------------------------------------------------------------------------------------------------------
  
  // Verificação se o valor recebido pelo sensor é realmente um dado possível de se ler
  if(isnan(umidade)){
    // Exibição de uma mensagem de erro caso a leitura acabe não dando certo
    Serial.println("Umidade: Erro ao ler os dados do sensor");
  } else {
    // Exibição da temperatura e umidade
    Serial.print("TempMáxima:");
    Serial.print(100);
    Serial.print(" ");
    Serial.print("TempMinima:");
    Serial.print(0);
    Serial.print(" ");
    Serial.print("Temperatura:");
    Serial.print(temperaturaCelsius);
    Serial.print(" ");
    Serial.print("UmiMaxima:");
    Serial.print("60");
    Serial.print(" ");
    Serial.print("Umidade:");
    Serial.println(umidade);
  }
  // Adição de um delay entre cada amostragem
  delay(500);
}