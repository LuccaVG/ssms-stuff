USE HealthClinic

CREATE TABLE TipoUsuario (
IdTipoDeUsuario INT PRIMARY KEY IDENTITY,
TituloTipoUsuario VARCHAR(40)
)

CREATE TABLE Clinica(
IdClinica INT PRIMARY KEY IDENTITY,
NomeClinica VARCHAR(40),
Endereco VARCHAR(80)
)

CREATE TABLE Especialidade(
IdEspecialidade INT PRIMARY KEY IDENTITY,
NomeEspecialidade VARCHAR(40)
)

CREATE TABLE Feedback(
IdFeedback INT PRIMARY KEY IDENTITY,
Feedback VARCHAR(200)
)

CREATE TABLE Usuario(
IdUsuario INT PRIMARY KEY IDENTITY,
IdTipoDeUsuario INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoDeUsuario),
Nome VARCHAR(60),
Email VARCHAR(60),
Senha VARCHAR(30)
)

CREATE TABLE Paciente(
IdPaciente INT PRIMARY KEY IDENTITY,
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
CPF VARCHAR(11)
)

CREATE TABLE Medico(
IdMedico INT PRIMARY KEY IDENTITY,
IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica),
IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade),
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
CRM VARCHAR(6) UNIQUE
)

CREATE TABLE Consulta(
IdConsulta INT PRIMARY KEY IDENTITY,
IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico),
IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
IdFeedback INT FOREIGN KEY REFERENCES Feedback(IdFeedback),
[Data] DATE,
[Hora] TIME)


INSERT INTO TipoUsuario
(TituloTipoUsuario) VALUES('Admininstrador'),('Comum');

INSERT INTO Usuario
(IdTipoDeUsuario,Nome,Email,Senha) VALUES(1,'Clóvis Basílio dos Santos','Cloviskid@gmail.com','69420');

INSERT INTO Paciente
(IdUsuario,CPF) VALUES('1','12345678912');

INSERT INTO Clinica
(NomeClinica,Endereco) VALUES('Clinica Clóvis Basílio dos Santos','Rua KID,123');

INSERT INTO Especialidade
(NomeEspecialidade) VALUES('Urologista');

INSERT INTO Medico
(IdClinica,IdEspecialidade,IdUsuario,CRM) VALUES(1,1,2,'694200');

INSERT INTO Feedback
(Feedback) VALUES('Consulta muito boa, o melhor medico que eu ja vi. Claramente um profissional grandioso.');

INSERT INTO Consulta
(IdMedico,IdPaciente,IdFeedback,[Data],[Hora]) VALUES(1,3,1,'2023-12-12','15:30:00');

/*- Id Consulta
- Data da Consulta
- Horario da Consulta
- Nome da Clinica
- Nome do Paciente
- Nome do Medico
- Especialidade do Medico
- CRM
- Prontuário ou Descricao
- FeedBack(Comentario da consulta)
*/

SELECT Usuario.Nome, FROM TipoUsuario
INNER JOIN Usuario
ON Usuario.IdUsuario = TipoUsuario.IdTipoDeUsuario;

Select * FROM Usuario
Select * FROM Paciente
Select * FROM Medico
Select * FROM Consulta
Select * FROM Clinica

