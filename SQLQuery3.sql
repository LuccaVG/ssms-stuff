--ATIVIDADE DQL

 -- listar as pessoas em ordem alfabética reversa, mostrando seus telefones, seus e-mails e suas CNHs

 --SCRIPT SEM USAR JOIN

 SELECT 

	P.Nome AS POTATO,
	Telefone.Numero AS Telefone ,
	E.Endereco AS Email,
	P.CNH
 FROM 
	Pessoa AS P,
	Email AS E,
	Telefone
 WHERE 
	P.IdPessoa = E.IdPessoa 
	AND P.IdPessoa = Telefone.IdPessoa
 ORDER BY 
	Nome DESC


