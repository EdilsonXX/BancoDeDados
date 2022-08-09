
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
