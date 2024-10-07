-- Primeira tabela
create database air_sense;
use air_sense;

create table Dados_Sensor(
id_teste int primary key auto_increment,
Umidade float,
Temperatura  float,
Horario_medição datetime default current_timestamp
);

insert into Dados_sensor value
(null,"40","39°",now()),
(null,"10","70°",now()),
(null,"44","45°",now()),
(null,"50","42°",now()),
(null,"70","44°",now());

select * from Dados_sensor;

-- Segunda tabela

create table Cadastros(
id int primary key auto_increment,
Nome varchar (40) not null,
email varchar (60) not null,
telefone varchar (15),
senha double
);

insert into Cadastros values
(Null,"João Silva","joao.silva@gamail.com","11 91234-5678",123456),
(Null,"Maria Oliveira","maria.oliveira@gamail.com","21 92345-6789",123456),
(Null,"Carlos Pereira","carlos.pereira@gamail.com","31 93456-7890",123456),
(Null,"Ana Souza","ana.souza@gamail.com","41 94567-8901",123456),
(Null,"Lucas Fernandes","lucas.fernandes@gamail.com","51 95678-9012",123456);

-- Terceira tabela 
create table Monitoramento_sistemas(
id_maquina int primary key auto_increment,
status_maquina varchar (15),
ultima_manutenção date,
ultima_medição datetime,
constraint chkStatus check(status_maquina in("Operante","Inoperante"))
);


insert into Monitoramento_sistemas values
(null,'Operante', '2024-08-20', '2024-09-09 14:30:00'),
(null,'Inoperante', '2024-07-15', '2024-09-08 09:15:00'),
(null,'Operante', '2024-09-01', '2024-09-09 12:45:00'),
(null,'Operante', '2024-06-22', '2024-09-07 16:20:00'),
(null,'Inoperante', '2024-09-05', '2024-09-09 08:00:00');

select * from Monitoramento_sistemas;

select * from Dados_sensor;

SELECT * FROM Dados_sensor WHERE Horario_medição = '2024-09-12';