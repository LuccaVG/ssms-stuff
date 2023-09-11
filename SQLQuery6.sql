CREATE DATABASE [Event+_Tarde]
USE [Event+_Tarde]

CREATE TABLE TiposDeUsuario
(
	IdTipoDeUsuario INT PRIMARY KEY IDENTITY,
	TituloTipoUsuario VARCHAR(50) NOT NULL	UNIQUE
)

CREATE TABLE TiposDeEvento
(
	IdTipoDeEvento INT PRIMARY KEY IDENTITY,
	TituloTipoEvento VARCHAR(50) NOT NULL	UNIQUE
)

CREATE TABLE Instituicao
(
IdInstituicao INT PRIMARY KEY  IDENTITY,
CNPJ CHAR(14) NOT NULL UNIQUE,
Endereco VARCHAR(200) NOT NULL,
NomeFantasia VARCHAR(200) NOT NULL
)


CREATE TABLE Usuario
(
	IdUsuario INT PRIMARY KEY IDENTITY,
	IdTipoDeUsuario INT FOREIGN KEY REFERENCES TiposDeUsuario(IdTipoDeUsuario) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	EMAIL VARCHAR(80) NOT NULL UNIQUE,
	Senha VARCHAR(60) NOT NULL
)


CREATE TABLE Evento
(
	IdEvento INT PRIMARY KEY IDENTITY,
	IdTipoDeEvento INT FOREIGN KEY REFERENCES TiposDeEvento(IdTipoDeEvento) NOT NULL,
	IdInstituicao INT FOREIGN KEY REFERENCES Instituicao(IdInstituicao) NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Descricao VARCHAR(100) NOT NULL,
	DataEvento DATE NOT NULL,
	HorarioEvento TIME NOT NULL
)


CREATE TABLE PresencasEvento
(
	IdPresencaEvento INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdEvento INT FOREIGN KEY REFERENCES Evento(IdEvento) NOT NULL,
	Situacao BIT DEFAULT(0)
)


CREATE TABLE ComentarioEvento
(
	IdComentarioEvento INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdEvento INT FOREIGN KEY REFERENCES Evento(IdEvento) NOT NULL,
	Descricao VARCHAR(200) NOT NULL,
	Exibe BIT DEFAULT(0)
)

use [Event+_Tarde];

insert into TiposDeUsuario (TituloTipoUsuario)
values ('Administrador'), ('Comum');

insert into TiposDeEvento (TituloTipoEvento)
values ('SQL Server');

insert into Instituicao (CNPJ, Endereco, NomeFantasia)
VALUES ('19037070000142','Rua Niteroi,180 São Caetano Do Sul','DevSchool');

INSERT INTO Usuario (IdTipoDeUsuario, Nome, EMAIL, Senha)
VALUES (1, 'Eduardo Costa', 'edu@admin.com', '123')

INSERT INTO Evento (IdTipoDeEvento, IdInstituicao, Nome, Descricao, DataEvento, HorarioEvento)
VALUES (1,1, 'Intensivão de SQL Server', 'Aula do Carlão e do Edu', '2023-09-11', '15:30:00');

INSERT INTO PresencasEvento (IdUsuario, IdEvento)
VALUES (1,1);

INSERT INTO ComentarioEvento (IdUsuario, IdEvento, Descricao, Exibe)
VALUES (1,1, 'Gostei desse evento, mano! foi top. O Careca lá manja',1);


SELECT 
	Usuario.Nome,
	TiposDeUsuario.TituloTipoUsuario,
	Evento.DataEvento,
	Instituicao.NomeFantasia, Instituicao.Endereco,
	TiposDeEvento.TituloTipoEvento,
	Evento.Nome,
	Evento.Descricao,
	PresencasEvento.Situacao,
	ComentarioEvento.Descricao
FROM Evento
	INNER JOIN TiposDeEvento
	ON Evento.IdTipoDeEvento = TiposDeEvento.IdTipoDeEvento
	INNER JOIN Instituicao
	ON Evento.IdTipoDeEvento = Instituicao.IdInstituicao
	INNER JOIN PresencasEvento
	ON Evento.IdEvento = PresencasEvento.IdEvento
	INNER JOIN Usuario
	ON Usuario.IdUsuario = PresencasEvento.IdUsuario
	INNER JOIN TiposDeUsuario
	ON TiposDeUsuario.IdTipoDeUsuario = Usuario.IdTipoDeUsuario
	LEFT JOIN ComentarioEvento
	ON ComentarioEvento.IdUsuario = Usuario.IdUsuario