create database sprint1bancdds;

use sprint1bancdds;

create table login (
idlogin int primary key auto_increment,
nome varchar (45) not null,
email varchar (45) not null,
senha varchar (45) not null,
recsenha varchar (45) not null,
constraint chksenha check (recsenha = senha),
temperatura int,
temperatura_crit int,
temperatura_crit2 int,
umidade int,
umidade_crit int,
umidade_crit2 int 
);
/*
temperatura = temperatura que o sensor obter,
temperatura_crit = temperatura em situação critica

umidade = quantidade de umidade que o sensor obter,
umidade_crit = quantidade de umidade em situação critica, 

*/
select * from login;


insert into login (idlogin, nome, email, senha, recsenha) values
(default, 'Juliano','Juliano@gmail.com','223211231','223211231');











