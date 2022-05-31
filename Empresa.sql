Drop database oficina;
Create database oficina;

USE oficina;

create table Empresa(

    idEmpresa int NOT NULL auto_increment primary key,
    nomeEmpresa varchar(120) NOT NULL,
    tipo varchar(45)
    
    );
    
	create index IDX_IDEMPRESA ON EMPRESA(idEmpresa);
    
create table Departamento(
 
  idDepartamento int NOT NULL auto_increment primary key,
  nomeDepartamento varchar(45) NOT NULL,
  descricaoDepartamento varchar(100) NOT NULL,
  idEmpresa int NOT NULL,
  constraint fk_idEmpresa_departamento foreign key(idEmpresa)
  references Empresa(idEmpresa)
  
  );
  
  create index IDX_IDDEPARTAMENTO ON DEPARTAMENTO(idDepartamento);
  
create table Endereco(

  idEndereco int NOT NULL auto_increment primary key,
  pais varchar(50) NOT NULL,
  estado varchar(50) NOT NULL,
  cidade varchar(50) NOT NULL,
  bairro varchar(50) NOT NULL,
  rua varchar(100) NOT NULL
  
  );
  
  create index IDX_IDENDERECO ON ENDERECO(idEndereco);
  
create table Telefone(

  idTelefone int NOT NULL auto_increment primary key,
  operadora varchar(50) NOT NULL,
  numero varchar(25) NOT NULL,
  idFuncionario int,
  idCliente int,
  constraint fk_idFuncionario_telefone foreign key(idFuncionario)
  references Funcionario(idFuncionario),
  constraint fk_idCliente_telefone foreign key(idCliente)
  references Cliente(idCliente)
  
  );

  create index IDX_IDTELEFONE ON TELEFONE(idTelefone);
  
create table Funcionario(
   
   idFuncionario int NOT NULL auto_increment primary key,
   nomeFuncionario varchar(120) NOT NULL,
   cpfFuncionario varchar(25) NOT NULL,
   idEndereco int NOT NULL,
   idDepartamento int NOT NULL,
   constraint fk_idDepartamento_funcionario foreign key(idDepartamento)
   references Departamento(idDepartamento),
   constraint fk_idEndereco_funcionario foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
   
   create index IDX_IDFUNCIONARIO ON FUNCIONARIO(idFuncionario);
   
create table Cliente(
   
   idCliente int NOT NULL auto_increment primary key,
   nomeCliente varchar(120) NOT NULL,
   cpfCliente varchar(24) NOT NULL,
   idEndereco int NOT NULL,
   constraint fk_idEndereco_cliente foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
  
  create index IDX_IDCLIENTE ON CLIENTE(idCliente);
  
create table OS(
   
   idOS int NOT NULL auto_increment primary key,
   dataSolicitacao varchar(100) NOT NULL,
   dataPrevisao varchar(100) NOT NULL,
   resposta varchar(45) NOT NULL,
   idFuncionario int NOT NULL,
   idDepartamento int NOT NULL,
   idCliente int NOT NULL,
   constraint fk_idFuncionario_OS foreign key(idFuncionario)
   references Funcionario(idFuncionario),
   constraint fk_idDepartamento_OS foreign key(idDepartamento)
   references Departamento(idDepartamento),
   constraint fk_idCliente_OS foreign key(idCliente)
   references Cliente(idCliente)
   
  
  );
  
  create index IDX_IDOS ON OS(idOS);
  
create table Itens_OS(
idServico int NOT NULL,
idOS int NOT NULL,
constraint fk_idServico_itens foreign key(idServico)
   references Servico(idServico),
   constraint fk_idOS_itens foreign key(idOS)
   references OS(idOS),
   PRIMARY KEY(idServico, idOS)

);
  
  create index IDX_IDSERVICO ON ITENS_OS(idServico);
  create index IDX_IDOS ON ITENS_OS(idOS);
  
create table Servico(
   
   idServico int NOT NULL auto_increment primary key,
   nomeServico varchar(120) NOT NULL,
   recursos varchar(200) NOT NULL
   
   );
   
   select a.nomeFuncionario, b.nomeDepartamento, c.pais, c.estado, c.cidade, c.bairro, c.rua from Funcionario a, Departamento b, Endereco c WHERE a.idDepartamento = b.idDepartamento and a.idEndereco = c.idEndereco;
   select d.nomeFuncionario, e.dataSolicitacao, e.dataPrevisao, e.resposta from Funcionario d, OS e WHERE e.idFuncionario = d.idFuncionario;
   
  select * from endereco;
  select * from departamento;
  select * from empresa;
  select * from Funcionario;
  select * from Cliente;
  select * from OS;
  select * from Servico;
  select * from Funcionario;
  select * from Itens_OS;
  
  create index IDX_IDSERVICO ON SERVICO(idServico);
  
  INSERT INTO Departamento (nomeDepartamento,descricaoDepartamento,idEmpresa)
VALUES
  ("sed, est.","vel turpis. Aliquam adipiscing lobortis risus. In mi pede,",1),
  ("convallis convallis","fringilla, porttitor vulputate, posuere vulputate, lacus. Cras",1),
  ("porta elit,","ornare placerat, orci lacus vestibulum lorem, sit",1),
  ("ornare. In","Mauris molestie pharetra nibh.",1),
  ("gravida mauris","sed dictum eleifend, nunc risus varius orci,",1),
  ("Nulla facilisis.","mauris elit, dictum eu, eleifend nec, malesuada",1),
  ("ligula. Donec","nec metus facilisis lorem",1),
  ("risus quis","Ut tincidunt vehicula risus.",1),
  ("nibh dolor,","amet massa. Quisque porttitor eros nec tellus. Nunc lectus",1),
  ("molestie in,","ante dictum cursus. Nunc mauris elit,",1);
  
  INSERT INTO Endereco (pais,estado,cidade,bairro,rua)
VALUES
  ("Vietnam","443354","Cañas","tellus eu augue porttitor","P.O. Box 297, 5109 Felis St."),
  ("Belgium","6466","Wanaka","arcu.","503-2730 Nulla Road"),
  ("China","171421","Falun","Ut nec","833-2068 Diam Rd."),
  ("Turkey","4275","Sandviken","sagittis augue, eu tempor erat neque non quam.","Ap #224-7539 Dui. Road"),
  ("Poland","4315","Lạng Sơn","nulla. Cras eu tellus eu augue","P.O. Box 247, 2482 Non, Rd.");

  INSERT INTO Funcionario (nomeFuncionario,cpfFuncionario,idEndereco,idDepartamento)
VALUES
  ("Jocelyn Cardenas","47465332365",2,1),
  ("Kimberly Irwin","51735853432",1,3),
  ("Bo Mccullough","62969852985",1,4),
  ("Neville Tillman","23665258887",3,8),
  ("Blaze Bean","71646743855",2,2);

  
  INSERT INTO Empresa (nomeEmpresa, tipo) values ("Conecta", "Matriz");
  INSERT INTO Departamento (nomeDepartamento, descricaoDepartamento, idEmpresa) values ("Suporte técnico", "Destinado para ateder clientes", "1");
  INSERT INTO Cliente (nomeCliente, cpfCliente, idEndereco) values ("Igor de Costa", "115.298.674-01", 1);
  INSERT INTO Endereco (pais, estado, cidade, bairro, rua) values ("Brasil", "Bahia", "Paulo Afonso", "Centenário", "Rua Duque Barbosa");
  INSERT INTO Funcionario (nomeFuncionario, cpfFuncionario, idEndereco, idDepartamento) values ("Arielly", "789.568.947-02", 2, 1);
  INSERT INTO OS (dataSolicitacao, dataPrevisao, resposta, idFuncionario, idDepartamento, idCliente) values ("02/07/2002", "03/07/2002", "Agendado", 1, 1, 1);
  INSERT INTO Servico (nomeServico, recursos) values ("Troca de roteador", "roteador");
  INSERT INTO Itens_OS (idServico, idOS) values (1, 1);
  INSERT INTO Telefone (operadora, numero, idFuncionario) values ("Vivo", "7582694714", 1);
  
  UPDATE Funcionario SET nomeFuncionario = "Gregório" WHERE idFuncionario = 1;
  
  ALTER TABLE OS MODIFY resposta VARCHAR(80);
  ALTER TABLE CLIENTE ADD idade VARCHAR(80);
  ALTER TABLE DEPARTAMENTO CHANGE COLUMN nomeDepartamento nome_Departamento VARCHAR(80)NOT NULL;
