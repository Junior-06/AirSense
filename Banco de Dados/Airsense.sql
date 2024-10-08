create database Airsense;
use Airsense;

create table informaçõesSistema(
idInformaçõesSistema int primary key auto_increment,
nomeSubSistema varchar(45),
localização varchar(45)
);

create table sensor (
idSensor int primary key auto_increment,
 tipoSensor varchar(45),
 posicao varchar(45),
 fkSubSis int,
 constraint fkSubSistema foreign key (fkSubSis) references informaçõesSistema (idInformaçõesSistema)
 );
 
 create table leituraAmbiente (
 idLeituraAmbiente int primary key auto_increment,
 dtHora_medicao datetime,
 temperatura varchar(45),
 umidade varchar(45),
 fkSubSistema int,
 fkSensor int,
 constraint fkSubSistemas foreign key (fkSubSistema) references informaçõesSistema (idInformaçõesSistema),
 constraint fkSensores foreign key (fkSensor) references sensor (idSensor)
 );
 
 create table Usuario(
 idUsuario int primary key auto_increment,
 nomeUsuario varchar(45),
 emailContato varchar(45),
 telefoneContato char(14),
 função varchar(45)
);

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(45),
cidade varchar(45),
rua varchar(45), 
numero varchar (45), 
fkResponsavel int,
fkInformaçõesSistema int,
constraint fkFuncResp foreign key (fkResponsavel) references Usuario (idUsuario),
constraint fkInformações foreign key (fkInformaçõesSistema) references  leituraAmbiente (idLeituraAmbiente)
);

INSERT INTO informaçõesSistema (nomeSubSistema, localização)
VALUES 
  ('Compressor de Ar', 'Linha de Montagem 1'),
  ('Cilindro Pneumático', 'Linha de Montagem 2');
  
  INSERT INTO sensor (tipoSensor, posicao, fkSubSis)
VALUES 
  ('Sensor de Temperatura', 'Próximo à saída do compressor', 1),
  ('Sensor de Umidade', 'Centro do cilindro', 2);
  
  INSERT INTO leituraAmbiente (dtHora_medicao, temperatura, umidade, fkSubSistema, fkSensor)
VALUES 
  ('2024-10-07 08:45:00', '90°C', '12%', 1, 1),
  ('2024-10-07 09:30:00', '85°C', '15%', 2, 2);
  
  INSERT INTO Usuario (nomeUsuario, emailContato, telefoneContato, função)
VALUES 
  ('Carlos Oliveira', 'carlos.oliveira@automec.com', '1199999-1111', 'Engenheiro de Manutenção'),
  ('Ana Fernandes', 'ana.fernandes@automec.com', '1198888-2222', 'Técnico de Monitoramento');
  
  INSERT INTO Empresa (nomeEmpresa, cidade, rua, numero, fkResponsavel, fkInformaçõesSistema)
VALUES 
  ('AutoMec Sistemas Pneumáticos', 'São Bernardo do Campo', 'Rua Industrial', '1001', 1, 1),
  ('PneumáticaTech', 'São Caetano do Sul', 'Av. Automobilística', '2020', 2, 2);


 

 
 