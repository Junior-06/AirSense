CREATE DATABASE airsense;
USE airsense;

CREATE TABLE cadastro(
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    telefone varchar(15),
    email VARCHAR(50) NOT NULL,
	CONSTRAINT chkEmail CHECK (email like '%@%'),
    senha VARCHAR(30) NOT NULL
);

CREATE TABLE sensorDados(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    tipoSensor varchar(5),
    statusSensor varchar(30),
    temperatura FLOAT,
    umidade FLOAT,
    horario datetime default current_timestamp
);

CREATE TABLE valorMaximo(
	idValor INT PRIMARY KEY AUTO_INCREMENT,
    maxTemp FLOAT,
    minTemp FLOAT,
    maxUmi FLOAT,
    minUmi FLOAT
);

CREATE TABLE infoSistema(
	idSistema INT PRIMARY KEY AUTO_INCREMENT,
    statusMaquina VARCHAR(15),
    ultimoReparo DATE,
    localizacao varchar(40)
);

INSERT INTO cadastro VALUES
	(default, 'Honda', '(19) 98952-6242', 'contatoHonda@honda.com', '038tlNct59q5'),
	(default, 'Toyota', '(68) 96406-4695', 'contatoToyota@toyota.com', 'y0n6606BUFct'),
	(default, 'Volkswagen', '(54) 96615-6336', 'contatoVolkswagen@volkswagen.com', 'SlgJ7z70Cy5z'),
	(default, 'Fiat', '(55) 99679-3412', 'contatoFia@fiat.com', 'P59AdqzhJ49D'),
	(default, 'Chevrolet', '(77) 96823-7819', 'contatoChevrolet@chevrolet.com', 'WXfvI6p9yE9q'),
	(default, 'Ferrari', '(83) 98995-1249', 'contatoFerrari@ferrari.com', 'sr07BE31QsP8'),
	(default, 'Lamborghini', '(16) 98181-0880', 'contatoLamborghini@lamborghini.com', 'qm7gT4d5IL2G'),
	(default, 'Mercedes', '(21) 97278-1423', 'contatoMercedes@mercedes.com', 'Ruv61w3IW5IY'),
	(default, 'Nissan', '(49) 96765-9494', 'contatoNissan@nissan.com', 'WkIx53c5uarl'),
	(default, 'Hyundai', '(75) 99571-0614', 'contatoHyundai@hyundai.com', 'Xw202K9cn0a7');
    
INSERT INTO sensorDados VALUES
	(default, 'LM35', 'ligado', 28.5, 14.7, '2024-09-06 02:40:01'),
	(default, 'DHT11', 'ligado', 13.6, 16.9, '2024-09-06 06:20:25'),
	(default, 'LM35', 'desligado', 26.0, 12.2, '2024-09-05 19:33:52'),
	(default, 'LM35', 'ligado', 11.7, 17.8, '2024-09-06 01:23:04'),
	(default, 'DHT11', 'desligado', 23.8, 12.8, '2024-09-05 19:43:45'),
	(default, 'DHT11', 'desligado', 12.2, 13.8, '2024-09-06 13:32:25'),
	(default, 'LM35', 'ligado', 17.0, 16.7, '2024-09-06 04:14:22'),
	(default, 'DHT11', 'ligado', 19.8, 10.4, '2024-09-05 18:33:15'),
	(default, 'LM35', 'desligado', 13.2, 16.1, '2024-09-06 13:57:46'),
	(default, 'DHT11', 'ligado', 29.2, 7.8, '2024-09-05 15:31:08');
    
INSERT INTO valorMaximo VALUES
	(default, 40.0, 12.5, 17.5, 5.0),
	(default, 20.0, 3.5, 18.0, 3.0),
	(default, 30.0, 10.0, 15.0, 4.0),
	(default, 35.0, 14.0, 16.0, 4.5),
	(default, 32.5, 11.0, 17.2, 4.2),
	(default, 25.0, 9.5, 14.0, 3.8),
	(default, 28.0, 11.8, 15.5, 4.0),
	(default, 29.5, 10.5, 16.3, 4.1),
	(default, 27.0, 13.2, 15.8, 4.3),
	(default, 33.0, 9.0, 12.5, 4.5);
    
INSERT INTO infoSistema VALUES
	(default, 'ligado', '2024-05-28', 'Setor A'),
	(default, 'desligado', '2024-08-06', 'Area HJ3'),
	(default, 'ligado', '2024-05-08', 'Subsetor MP'),
	(default, 'ligado', '2024-08-03', 'Setor X'),
	(default, 'desligado', '2024-06-18', 'Setor 3C'),
	(default, 'desligado', '2024-05-12', 'Subsetor KM09'),
	(default, 'ligado', '2024-06-25', 'Setor T'),
	(default, 'desligado', '2024-05-19', 'Area GQ2I'),
	(default, 'ligado', '2024-07-28', 'Setor FG'),
	(default, 'ligado', '2024-05-08', 'Setor IB');
    
select nome as Nome, telefone as Telefone, 
email as Email, senha as Senha from cadastro;

select tipoSensor as Sensor, statusSensor as 'Status do sensor', temperatura as Temperatura, 
umidade as Umidade, horario as 'Data e hora' from sensorDados;

select maxTemp as 'Temperatura máxima', minTemp as 'Temperatura mínima', 
maxUmi as 'Umidade máxima', minUmi as 'Umidade mínima' from valorMaximo;

select statusMaquina as 'Status da máquina', ultimoReparo as 'Data do ultimo reparo',
localizacao as Localização from infoSistema;

select * from sensorDados
	where statusSensor = 'ligado';
    
select * from infoSistema
	where localizacao like 'Setor%';