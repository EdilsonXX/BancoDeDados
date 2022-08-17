
CREATE DATABASE BDEscola;

USE BDEscola;

select * from aluno;
select * from campus;
select * from curso;
select * from cursoDisciplina;
select * from notas;
select * from professor;
select * from telefone_Aluno;
select * from telefone_Professor;

select A.nome_Aluno, (select COUNT(N.id_Aluno) from Notas N, Disciplina D where N.id_Disciplina = D.id_Disciplina and A.id_aluno = N.id_aluno) FROM Aluno A;

select A.nome_Aluno from Aluno A where A.id_Aluno not in (select N.id_Aluno from Notas N);

select T.nome_Aluno, T.Quantidade_Disciplina FROM (select A.nome_Aluno,(select COUNT(N.id_Aluno) FROM Notas N, Disciplina D where N.id_Disciplina = D.id_Disciplina and A.id_aluno = N.id_aluno) as Quantidade_Disciplina from Aluno A group by A.id_Aluno) T where T.Quantidade_Disciplina < 2;

DELIMITER $$

CREATE PROCEDURE LISTAR_ALUNOS(IN quantidade int)
BEGIN

 SELECT * FROM ALUNO LIMIT quantidade;

END$$

DELIMITER ;
CALL LISTAR_ALUNOS(5);

DELIMITER $$

CREATE PROCEDURE ANALISE_NOTAS(OUT NOME VARCHAR(120), OUT MAX_NOTA DOUBLE, IN IDALUNO INT)
BEGIN

 SELECT NOME_ALUNO INTO NOME FROM ALUNO WHERE ID_ALUNO = IDALUNO;
 
 SELECT MAX(N.NOTA) INTO MAX_NOTA FROM NOTAS N WHERE N.ID_ALUNO = IDALUNO;
 
END$$

DELIMITER ;

SET @NOME = "";
SET @MAX_NOTA = 0;

CALL ANALISE_NOTAS(@NOME, @MAX_NOTA, 5);

SELECT @NOME, @MAX_NOTA;
