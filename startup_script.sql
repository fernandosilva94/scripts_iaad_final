begin;
drop schema if exists Startup; 
create schema Startup;
use Startup;

create table startup(
	id_startup CHAR(5), 
    nome_startup VARCHAR(50) not null, 
    cidade_sede VARCHAR (50),
    PRIMARY KEY (id_startup));

create table programador(
	id_programador int NOT NULL auto_increment, 
	id_startup CHAR(5),
    nome_programador VARCHAR(50) not null, 
    genero CHAR(1), -- I
    data_nascimento DATE, 
    email VARCHAR(50), 
    PRIMARY KEY (id_programador),
    UNIQUE(email)); 
 
create table linguagem_programacao(
	id_linguagem int, 
    nome_linguagem VARCHAR(50) not null, 
    ano_lançamento YEAR, 
    PRIMARY KEY(id_linguagem)); 
 
create table programador_linguagem(
	id_programador int,
	id_linguagem int);
 
 create table criacao_startup(
	id_startup CHAR(5),
	data_criacao date,
    PRIMARY KEY(id_startup)); 
  
-- populando tabelas
insert into startup values
('10001', 'Tech4Toy', 'Porto Alegre'),
('10002', 'Smart123','Belo Horizonte'),
('10003', 'knowledgeUp','Rio de Janeiro'),
('10004', 'BSI Next Level','Recife'),
('10005', 'QualiHealth','São Paulo'),
('10006', 'ProEdu','Florianópolis');

insert into programador values 
(30001, '10001', 'João Pedro', 'M', '1993-06-23', 'teste1@teste.com'),
(30002, '10002', 'Paula Silva', 'F', '1986-01-10', 'teste2@teste.com'),
(30003, '10003', 'Renata Vieira', 'F', '1991-07-05', 'teste3@teste.com'),
(30004, '10004', 'Felipe Santos', 'M', '1976-11-25', 'teste4@teste.com'),
(30005, '10001', 'Ana Cristina', 'F', '1968-02-19', 'teste5@teste.com'),
(30006, '10004', 'Alexandre Alves', 'M', '1988-07-07', 'teste6@teste.com'),
(30007, '10002', 'Laura Marques', 'F', '1987-10-04', 'teste7@teste.com');

insert into linguagem_programacao values
(20001, 'Python', 1991),
(20002, 'PHP', 1995),
(20003, 'Java', 1995),
(20004, 'C', 1972),
(20005, 'JavaScript', 1995),
(20006, 'Dart', 2011);

insert into programador_linguagem values
(30001, 20001),
(30001, 20002),
(30002, 20003),
(30003, 20004),
(30003, 20005),
(30004, 20005),
(30007, 20001),
(30007, 20002);



alter table programador_linguagem ADD FOREIGN KEY(id_linguagem) REFERENCES linguagem_programacao(id_linguagem) ON DELETE CASCADE ON UPDATE CASCADE; 
alter table criacao_startup ADD FOREIGN KEY(id_startup) REFERENCES startup(id_startup) ON DELETE CASCADE ON UPDATE CASCADE; 
alter table programador_linguagem ADD FOREIGN KEY(id_programador) REFERENCES programador(id_programador) ON DELETE CASCADE ON UPDATE CASCADE; 
alter table programador ADD FOREIGN KEY(id_startup) REFERENCES startup(id_startup) ON UPDATE CASCADE;
alter table programador AUTO_INCREMENT=30000;

commit;