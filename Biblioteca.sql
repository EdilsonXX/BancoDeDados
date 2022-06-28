DROP database biblioteca;
Create database biblioteca;

USE biblioteca;

create table Biblioteca(

    idBiblioteca int NOT NULL auto_increment primary key,
    nomeBiblioteca varchar(120) NOT NULL,
    estadoBiblioteca varchar(45) NOT NULL,
    cidadeBiblioteca varchar(120) NOT NULL,
    bairroBiblioteca varchar(45) NOT NULL,
    ruaBiblioteca varchar(45) NOT NULL
    );
    
	create index IDX_IDBIBLIOTECA ON BIBLIOTECA(idBiblioteca);
    
create table Funcionario(
   
   idFuncionario int NOT NULL auto_increment primary key,
   nomeFuncionario varchar(120) NOT NULL,
   cpfFuncionario varchar(25) NOT NULL,
   estadoFuncionario varchar(45) NOT NULL,
   cidadeFuncionario varchar(120) NOT NULL,
   bairroFuncionario varchar(45) NOT NULL,
   ruaFuncionario varchar(45) NOT NULL,
   idBiblioteca INT NOT NULL,
   constraint fk_idBiblioteca_funcionario foreign key(idBiblioteca)
   references Biblioteca(idBiblioteca)
   );
   
    create index IDX_IDFUNCIONARIO ON FUNCIONARIO(idFuncionario);
    
create table Cliente(

   idCliente int NOT NULL auto_increment primary key,
   nomeCliente varchar(120) NOT NULL,
   cpfCliente varchar(24) NOT NULL,
   estadoCliente varchar(45) NOT NULL,
   cidadeCliente varchar(120) NOT NULL,
   bairroCliente varchar(45) NOT NULL,
   ruaCliente varchar(45) NOT NULL
   );
  
  create index IDX_IDCLIENTE ON CLIENTE(idCliente);
   
create table Telefone(

  idTelefone int NOT NULL auto_increment primary key,
  operadora varchar(50) NOT NULL,
  numero varchar(25) NOT NULL,
  idFuncionario int,
  idCliente int,
  idBiblioteca int,
  constraint fk_idFuncionario_telefone foreign key(idFuncionario)
  references Funcionario(idFuncionario),
  constraint fk_idCliente_telefone foreign key(idCliente)
  references Cliente(idCliente),
  constraint fk_idBiblioteca_telefone foreign key(idBiblioteca)
  references Biblioteca(idBiblioteca)
  );
  
  create index IDX_IDTELEFONE ON TELEFONE(idTelefone);
  
create table Agendamento(
   
   idAgendamento int NOT NULL auto_increment primary key,
   dataSolicitacaoAgendamento varchar(100) NOT NULL,
   dataEntregaAgendamento varchar(100) NOT NULL,
   respostaAgendamento varchar(45) NOT NULL,
   idFuncionario int NOT NULL,
   idCliente int NOT NULL,
   constraint fk_idFuncionario_OS foreign key(idFuncionario)
   references Funcionario(idFuncionario),
   constraint fk_idCliente_OS foreign key(idCliente)
   references Cliente(idCliente)
  );
  
  create index IDX_IDAGENDAMENTO ON AGENDAMENTO(idAgendamento);
  
create table Livro(
   
   idLivro int NOT NULL auto_increment primary key,
   nomeLivro varchar(120) NOT NULL,
   autorLivro varchar(24) NOT NULL,
   editoraLivro varchar(24) NOT NULL,
   anoLancamentoLivro int NOT NULL
   );
   
    create index IDX_IDLIVRO ON LIVRO(idLivro);
    
create table Agendar_Livros(
   idLivro int NOT NULL,
   idAgendamento int NOT NULL,
   constraint fk_idLivro_agendar foreign key(idLivro)
   references Livro(idLivro),
   constraint fk_idAgendamento_agendar foreign key(idAgendamento)
   references Agendamento(idAgendamento),
   PRIMARY KEY(idLivro, idAgendamento)

);

  create index IDX_IDLIVRO ON AGENDAR_LIVROS(idLivro);
  create index IDX_IDAGENDAMENTO ON AGENDAR_LIVROS(idAgendamento);
  
  select * from Biblioteca;
  select * from Funcionario;
  select * from Cliente;
  select * from Livro;
  select * from Telefone;
  select * from Agendamento;
  select * from Agendar_Livros;
  
  select count(nomeFuncionario) FROM Funcionario;
  select nomeCliente as Clientezinho FROM Cliente ;
  
  select a.respostaAgendamento, a.dataSolicitacaoAgendamento, a.dataEntregaAgendamento, f.nomeFuncionario, f.cpfFuncionario, c.nomeCliente, c.cpfCliente, l.nomeLivro From Livro l INNER Join Agendar_Livros g ON (l.idLivro = g.idLivro) INNER JOIN Agendamento a ON (g.idAgendamento = a.idAgendamento) INNER JOIN Funcionario f ON (a.idFuncionario = f.idFuncionario) INNER JOIN Cliente c ON (a.idCliente = c.idCliente);
 
   INSERT INTO Biblioteca (nomeBiblioteca,estadoBiblioteca,cidadeBiblioteca, bairroBiblioteca, ruaBiblioteca)
VALUES
  ("Ifba Tech","Bahia","Paulo Afonso", "Vila Militar", "Marechal da Fonseca");
  
  INSERT INTO Funcionario (nomeFuncionario,cpfFuncionario, estadoFuncionario,cidadeFuncionario, bairroFuncionario, ruaFuncionario, idBiblioteca)
VALUES
  ("Gregório", "25189745620","Bahia","Paulo Afonso", "Centenário", "Mestre Henrique", 1),
  ("Aryelle", "24896573210","Alagoas","Delmiro Gouveia", "Bairro Novo", "13 de Maio", 1),
  ("Fredson", "54137498505","Sergipe","Canindé", "Pedra Velha", "7 de Setembro", 1),
  ("Matheus", "46875132846","Pernambuco","Petrolandia", "Cohab", "Duque de Caxias", 1),
  ("Romildo", "78913258439","Sao Paulo","Florianopoles", "Desvio", "Lindoarte Batista", 1);
  
  INSERT INTO Cliente (nomeCliente,cpfCliente, estadoCliente,cidadeCliente, bairroCliente, ruaCliente)
VALUES
  ("Roberta", "54862694618","Bahia","Ilheus", "BTN", "Josildo Alves"),
  ("Gabriel", "74135986207","Alagoas","Piranhas", "369 Casas", "Batista Lima"),
  ("Marcelo", "98742065341","Sergipe","Aracaju", "Cidade Universitaria", "Veradore Ronaldo"),
  ("Dantas", "45398720487","Pernambuco","Recife", "Olina", "Bejamin Arola"),
  ("Pito", "84521673094","Sao Paulo","São Paulo", "Campo Grande", "Cadeado aberto");
  
   INSERT INTO Livro (nomeLivro, autorLivro, editoraLivro, anoLancamentoLivro)
VALUES
  ("50 tons de Cinza", "Mauricio de Souza","Fox", 2002),
  ("A 5 passos de voce", "Igor Costa","Brasil Livros", 2005),
  ("Requiem para um sonho", "Paola Bracho","TNT", 2010),
  ("Behind Closed Doors", "Maria Jucineide","SBT", 2017),
  ("The Silent Patient", "Luiz Gabriel","Nicklodean", 2021);
  
   INSERT INTO Telefone (operadora, numero, idFuncionario)
VALUES
  ("Tim", "82984759632", 1),
  ("Vivo", "75945217896", 2),
  ("Laricell", "50932145896", 3),
  ("Oi", "78974128563", 4),
  ("Vivo", "65996874562", 5); 
  
  INSERT INTO Telefone (operadora, numero, idCliente)
VALUES
  ("Claro", "74925478916", 1),
  ("Tim", "84936528479", 2),
  ("OI", "41915428967", 3),
  ("Laricell", "21934589612", 4),
  ("Vivo", "39974856293", 5);
  
  INSERT INTO Telefone (operadora, numero, idBiblioteca)
VALUES
  ("LariCell", "759845216379", 1),
  ("Tim", "75941268357", 1);
  
   INSERT INTO Agendamento (dataSolicitacaoAgendamento, dataEntregaAgendamento, respostaAgendamento, idFuncionario, idCliente)
VALUES
  ("20/06/2022", "29/06/2022","Comodato", 1, 1),
  ("15/06/2022", "20/06/2022","Devoldido", 2, 2),
  ("23/06/2022", "30/06/2022","Agendado", 3, 3),
  ("23/06/2022", "01/07/2022","Agendado", 4, 4),
  ("21/06/2022", "23/06/2022","Devolvido", 5, 5);
  
  INSERT INTO Agendar_Livros (idLivro,idAgendamento)
VALUES
  (5,1),
  (4,2),
  (3,3),
  (2,4),
  (1,5);
