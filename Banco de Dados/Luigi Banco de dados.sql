CREATE DATABASE ProjetoBancoLuigi;
use ProjetoBancoLuigi;

Create table Cadastrodeusuários(
idUser int primary key auto_increment,
nomeEmpresa varchar (50) NOT NULL,
EmailEmpresarial varchar(100) NOT NULL, 
Senha varchar(30) NOT NULL, 
ConfirmarSenha varchar(15) NOT NULL,
NomePessoaFísica varchar(40) NOT NULL
);
alter table Cadastrodeusuários add constraint chkConfirmar CHECK (ConfirmarSenha = Senha);

desc Cadastrodeusuário;

INSERT INTO Cadastrodeusuários VALUES
(default, 'MCDONALD', 'luigiprogramador1010@gmail.com', 'urubu100', 'urubu100', 'Luigi');

SELECT * FROM Cadastrodeusuários;
delete from Cadastrodeusuários
where idUser = 2;

INSERT INTO cadastro VALUES
(default, 'BurgerKing', 'burgerking@gmail.com', 'urubu200', 'urubu200', 'Mario');


-- próxima tabela para mostrar os sensores do usuário 
Create Table SensoresUser(
iijdUser int primary key auto_increment,
Email varchar (40), 
Instituição varchar (40), 
qtdSensores int,
SensorUmidade int,
SensorTemp int
);

desc sensoresuser;

Insert into SensoresUSER VALUES 
(default,'luigiprogramador1010@gmail.com', 'MCDONALD', 3, 2 ,1);



INSERT INTO SensoresUSER values
(default, 'Luigiprogramador1010@gmail.com.com', 'MCDONALD', 4,2,2),
(default, 'Burgerking@gmail.com', 'Burgerking', 1,0,1);

select * from SensoresUSER;
-- Ao invés de email, podemos puxar pelo nome ou algum outro dado.