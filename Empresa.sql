Drop database oficina;
Create database oficina;
SELECT * FROM Cliente;

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
  numero varchar(13) NOT NULL,
  idFuncionario int NOT NULL,
  idCliente int NOT NULL,
  constraint fk_idFuncionario_telefone foreign key(idFuncionario)
  references Funcionario(idFuncionario),
  constraint fk_idCliente_telefone foreign key(idCliente)
  references Cliente(idCliente)
  
  );

  create index IDX_IDTELEFONE ON TELEFONE(idTelefone);
  
create table Funcionario(
   
   idFuncionario int NOT NULL auto_increment primary key,
   nomeFuncionario varchar(120) NOT NULL,
   cpfFuncionario varchar(11) NOT NULL,
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
   cpfCliente varchar(20) NOT NULL,
   idEndereco int NOT NULL,
   constraint fk_idEndereco_cliente foreign key(idEndereco)
   references Endereco(idEndereco)
   
   );
  
  create index IDX_IDCLIENTE ON CLIENTE(idCliente);
  
create table OS(
   
   idOS int NOT NULL auto_increment primary key,
   dataSolicitacao varchar(10) NOT NULL,
   dataPrevisao varchar(10) NOT NULL,
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
  
  create index IDX_IDSERVICO ON SERVICO(idServico);
  
  ALTER TABLE OS MODIFY resposta VARCHAR(80);
  ALTER TABLE CLIENTE ADD idade VARCHAR(80);
  ALTER TABLE DEPARTAMENTO CHANGE COLUMN nomeDepartamento nome_Departamento VARCHAR(80)NOT NULL;