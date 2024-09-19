
create database air_sense;
use air_sense;

-- Tabela de dados do sensor

create table Dados_Sensor(
id_teste int primary key auto_increment,
Umidade varchar (200) not null,
Temperatura varchar (200) not null,
Horario_medição datetime default current_timestamp
);

insert into Dados_sensor value
(null,"40%","39°",now()),
(null,"10%","70°",now()),
(null,"44%","45°",now()),
(null,"50%","42°",now()),
(null,"70%","44°",now());

select * from Dados_sensor;

-- Tabela de cadastros de clientes 

create table Empresas(
id int primary key auto_increment,
empresa varchar (40) not null,
email varchar (60) not null,
telefone varchar (15),
senha varchar(20)
);

insert into Empresas values
(Null,"tesla","joao.silva@tesla.com","11 91234-5678",123456),
(Null,"Ferrari","maria.oliveira@Ferrari.com","21 92345-6789",123456),
(Null,"Mercedez","carlos.pereira@Mercedez.com","31 93456-7890",123456),
(Null,"BMW","ana.souza@BMW.com","41 94567-8901",123456),
(Null,"Build your Dreams","lucas.fernandes@BYD.com","51 95678-9012",123456);

create table Funcionario(
id int primary key auto_increment,
Nome varchar (40) not null,
email varchar (60) not null,
telefone varchar (15),
senha varchar(20)
);

insert into Funcionario values
(Null,"Joao Silva","joao.silva@gmail.com","11 91234-5678",2345678),
(Null,"Maria Oliveira","maria.oliveira@gmail.com","21 92345-6789",2345678),
(Null,"Carlos Pereira","carlos.pereira@gmail.com","31 93456-7890",2345678),
(Null,"Ana Souza","ana.souza@gmail.com","41 94567-8901",2345678),
(Null,"Lucas Fernandes","lucas.fernandes@gmail.com","51 95678-9012",2345678);

-- Tabela de monitoramento de Sistemas 
create table Monitoramento_sistemas(
id_maquina int primary key auto_increment,
status_maquina varchar (15),
ultima_manutenção date,
ultima_medição datetime
);

alter table Monitoramento_sistemas add constraint chkStatus check(status_maquina in("Operante","Inoperante"));

insert into Monitoramento_sistemas values
(null,'Operante', '2024-08-20', '2024-09-09 14:30:00'),
(null,'Inoperante', '2024-07-15', '2024-09-08 09:15:00'),
(null,'Operante', '2024-09-01', '2024-09-09 12:45:00'),
(null,'Operante', '2024-06-22', '2024-09-07 16:20:00'),
(null,'Inoperante', '2024-09-05', '2024-09-09 08:00:00');

select * from Monitoramento_sistemas;

SELECT * FROM Dados_sensor WHERE Umidade > 50;

Select * from Dados_sensor;

Select * from Empresas;

select * from Funcionario;

select * from Monitoramento_sistemas;
select * from Monitoramento_sistemas;
select * from Monitoramento_sistemas where ultima_medição like "2024-09-08 %";