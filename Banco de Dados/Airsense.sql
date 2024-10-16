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
 função varchar(45),
 fkEmpresa int,
 constraint fkEmpresa foreign key (fkEmpresa) references  Empresa (idEmpresa)
);

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(45),
cidade varchar(45),
rua varchar(45), 
numero varchar (45), 
fkInformaçõesSistema int,
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
  
  INSERT INTO Empresa (nomeEmpresa, cidade, rua, numero, fkInformaçõesSistema)
VALUES 
  ('AutoMec Sistemas Pneumáticos', 'São Bernardo do Campo', 'Rua Industrial', '1001',1),
  ('PneumáticaTech', 'São Caetano do Sul', 'Av. Automobilística', '2020',2);

INSERT INTO informaçõesSistema (nomeSubSistema, localização)
VALUES 
  ('Válvula Reguladora de Pressão', 'Linha de Montagem 3'),
  ('Filtro de Ar', 'Linha de Montagem 4');


INSERT INTO sensor (tipoSensor, posicao, fkSubSis)
VALUES 
  ('Sensor de Pressão', 'Entrada da válvula reguladora', 3),
  ('Sensor de Partículas', 'Entrada do filtro de ar', 4);


INSERT INTO leituraAmbiente (dtHora_medicao, temperatura, umidade, fkSubSistema, fkSensor)
VALUES 
  ('2024-10-07 10:00:00', '60°C', '10%', 3, 3),
  ('2024-10-07 11:00:00', '55°C', '8%', 4, 4);

INSERT INTO Usuario (nomeUsuario, emailContato, telefoneContato, função)
VALUES 
  ('João Pereira', 'joao.pereira@automec.com', '1197777-3333', 'Supervisor de Operações'),
  ('Mariana Silva', 'mariana.silva@automec.com', '1196666-4444', 'Engenheira de Processos');

INSERT INTO Empresa (nomeEmpresa, cidade, rua, numero, fkInformaçõesSistema)
VALUES 
  ('TecnoPneumática', 'Santo André', 'Av. Industrial', '3003', 3),
  ('Pressão Máxima Ltda', 'Mauá', 'Rua da Pressão', '5050', 4);
  
  INSERT INTO informaçõesSistema (nomeSubSistema, localização)
VALUES 
  ('Atuador Pneumático', 'Linha de Montagem 5'),
  ('Reservatório de Ar', 'Linha de Montagem 6'),
  ('Sensor de Fluxo de Ar', 'Laboratório de Testes'),
  ('Redutor de Pressão', 'Área de Manutenção'),
  ('Gerador de Vácuo', 'Estação de Embalagem');
  
  INSERT INTO sensor (tipoSensor, posicao, fkSubSis)
VALUES 
  ('Sensor de Pressão', 'Saída do atuador', 5),
  ('Sensor de Umidade', 'Saída do reservatório', 6),
  ('Sensor de Fluxo', 'Entrada do fluxo de ar', 7),
  ('Sensor de Pressão', 'Entrada do redutor', 8),
  ('Sensor de Vácuo', 'Saída do gerador de vácuo', 9);
  
  INSERT INTO leituraAmbiente (dtHora_medicao, temperatura, umidade, fkSubSistema, fkSensor)
VALUES 
  ('2024-10-07 12:00:00', '70°C', '20%', 5, 5),
  ('2024-10-07 13:00:00', '80°C', '18%', 6, 6),
  ('2024-10-07 14:00:00', '50°C', '25%', 7, 7),
  ('2024-10-07 15:00:00', '65°C', '30%', 8, 8),
  ('2024-10-07 16:00:00', '40°C', '5%', 9, 9);
  
  INSERT INTO Usuario (nomeUsuario, emailContato, telefoneContato, função)
VALUES 
  ('Roberto Lima', 'roberto.lima@automec.com', '1195555-5555', 'Gerente de Produção'),
  ('Clara Rodrigues', 'clara.rodrigues@automec.com', '1194444-6666', 'Técnico de Automação'),
  ('Lucas Santana', 'lucas.santana@automec.com', '1193333-7777', 'Operador de Máquinas'),
  ('Fernanda Costa', 'fernanda.costa@automec.com', '1192222-8888', 'Coordenadora de Qualidade'),
  ('Pedro Alves', 'pedro.alves@automec.com', '1191111-9999', 'Engenheiro de Desenvolvimento');
  
  INSERT INTO Empresa (nomeEmpresa, cidade, rua, numero, fkInformaçõesSistema)
VALUES 
  ('Pneumática Avançada', 'São Paulo', 'Av. das Indústrias', '4004', 5),
  ('Pressão Controlada', 'Diadema', 'Rua dos Engenheiros', '6060', 6),
  ('ArTech', 'Ribeirão Pires', 'Rua do Progresso', '7070', 7),
  ('FlowControl', 'Suzano', 'Av. Central', '8080', 8),
  ('Vacuum Solutions', 'Santo André', 'Rua do Vácuo', '9090', 9); 
  
  SELECT * FROM informaçõesSistema;
  SELECT * FROM sensor;
  SELECT * FROM leituraAmbiente;
  SELECT * FROM Usuario;
  SELECT * FROM Empresa;
  
  SELECT 
    e.idEmpresa,
    e.nomeEmpresa,
    e.cidade,
    e.rua,
    e.numero,
    i.nomeSubSistema,
    i.localização,
    s.tipoSensor,
    s.posicao,
    la.dtHora_medicao,
    la.temperatura,
    la.umidade
FROM 
    Empresa e
JOIN 
    informaçõesSistema i ON e.fkInformaçõesSistema = i.idInformaçõesSistema
JOIN 
    sensor s ON i.idInformaçõesSistema = s.fkSubSis
JOIN 
    leituraAmbiente la ON i.idInformaçõesSistema = la.fkSubSistema AND s.idSensor = la.fkSensor;
    
    
    SELECT 
    s.idSensor,
    s.tipoSensor,
    s.posicao,
    i.idInformaçõesSistema,
    i.nomeSubSistema,
    i.localização,
    la.idLeituraAmbiente,
    la.dtHora_medicao,
    la.temperatura,
    la.umidade
FROM 
    sensor s
JOIN 
    informaçõesSistema i ON s.fkSubSis = i.idInformaçõesSistema
JOIN 
    leituraAmbiente la ON i.idInformaçõesSistema = la.fkSubSistema AND s.idSensor = la.fkSensor;
    
