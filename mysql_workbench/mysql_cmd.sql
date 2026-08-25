Introdução Mysql_Workbench

-- CRIANDO BANCO DE DADOS 

create database db_Biblioteca;

-- VISUALIZANDO LISTADE BANCOS DE DADOS

show databases;

-- SELECIONANDO BD PARA INSERÇÃO DE TABELAS

use db_Biblioteca;

-- VISUALISAR BD  SELECIONADO

select database();

-- EXCLUINDO  BD

drop database [ if exists ] nome_bd;

-- VISUALIZANDO BD

show tables;

-- CRIANDO TABELAS NO  DB

use db_Bibliotaca;

-- CÓDIGO PARA CRIAÇÃO DE TABELA

create table if not exists tbl_Livro (
ID_Livro smallint auto_increment primary key,
Nome_Livro varchar(50) not null,
ISBN varchar(30) not null,
ID_Autor smallint not null,
Data_Pub date not null,
Preço_Livro decimal not null
);
 


-- CONFIRMANDO CRIAÇÃO DAS TABELAS

show tables;


-- CÓDIGO PARA CRIAÇÃO DE TABELA

create table tbl_Autores (
ID_Autor smallint primary key,
Nome_Autor varchar(50),
Sobrenome_Autor varchar(60)
);

create table tbl_editoras (
ID_Editoras smallint primary key auto_increment,
Nome_Editora varchar(50) not null
); 

show tables;

-- AUTO INCREMENTO EM COLUNAS

create table tbl_teste_incremento (
Codigo smallint primary key auto_increment,
Nome varchar(30) not null
) auto_increment = 15;

insert into tbl_teste_incremento (Nome) 
values ('um'),
('dois'),
('três'),
("quatro");

select * from tbl_teste_incremento;

show tables;

describe tbl_teste_incremento;

use db_Biblioteca;

select max(Codigo)
from tbl_teste_incremento;
-- ALTERANDO O PRÓXIMO VALORNA TABELA AUTO-INCREMENTO

alter table tbl_teste_incremento
auto_increment = 90; 

insert into tbl_teste_incremento (Nome) 
values ('nove'),('dez'),('onze'),('doze');

select * from tbl_teste_incremento;

insert into tbl_teste_incremento (Nome) 
values ('treze'),('quatorse'),('quinze'),('dizeseis');

select * from tbl_teste_incremento;

-- ALTEARANDO DADOS  ESTRUTURAIS DA TABELA......
→ EXCLUSÃO 
use db_Biblioteca;

alter table tbl_Livro
drop column ID_Autor;

select * from tbl_Livro;

-- ADICIONANDO DADOS NA TABELA / FK chave estrangeira....


select * from tbl_Livro;

alter table tbl_Livro
add ID_Autor smallint not null;


alter table tbl_Livro
add constraint fk_ID_Autor
foreign key (ID_Autor)
references  tbl_Autores (ID_Autor);


alter table tbl_Livro
add ID_Editoras smallint not null;

alter table tbl_Livro
add constraint fk_ID_Editoras
foreign key (ID_Editoras)
references tbl_editoras (ID_Editoras);

select * from tbl_Livro;

-- INSERINDO DADOS NA TABELA 

insert into tbl_Autores (ID_Autor, Nome_AUtor, Sobrenome_Autor) 
values 
(1, 'Daniel', 'barret'), 
(2, 'Gerard', 'Carter'), 
(3, 'Mark', 'Sobel'), 
(4, 'Willian', 'Stanek'),
(5, 'Richard', 'Blum'),
(6, 'Hoher534', 'Ndiey');

select * from tbl_Autores;

-- INSERINDO   DADOS NA TABELA / EDITORAS

insert into tbl_editoras (Nome_Editora)
values 
('Prentice Hall'), 
('O´Reilly'), 
('Microsoft Press'), 
('WIley');

select * from tbl_editoras;


-- INSERINDO DADOS  MULTIPLOS DADOS NA TABELA COM "INSERT INTO"...

insert into tbl_Livro (Nome_Livro, ISBN, Data_Pub, Preço_Livro, ID_Autor, ID_Editoras)
values 
('Linux Command Line Shell Script', 123456789, '20091221',68.35,5,4),
('SSH, The Secire Shell', 987654321, '20091221',61.45,2,2),
('Using Samba', 147852369,'20001221',58.30,2,2),
('Fedora And Red Hat Linux',159357852,'20101101',62.24,3,1),
('Windows Server 2012 Inside Out',654321987,'20040517',66.80,4,3),
('Microsoft Exchange Server 2010', 369852147, '20001221',45.30,4,3);

select * from tbl_Livro;

-- CONSULTA SIMPLES / SELECT ...

select Nome_Autor from tbl_Autores;

select * from tbl_Autores;

select NOme_Livro from tbl_Livro;

-- ESPECIFICANDO AS COLUNAS A SEREMS SELECIONADAS...

select Nome_Livro, ISBN, Data_Pub
from tbl_Livro;


-- CONSULTANDO COM ORDENAÇÃO ' ORDER BY' ... 

select * from tbl_Livro
order by Nome_Livro ASC ;  -- Ascendente

select * from tbl_Livro
order by Nome_Livro DESC ; -- Descendente 

select Nome_Livro, ID_Editoras
from tbl_Livro
order by ID_Editoras;

select Nome_Livro, Preço_Livro
from tbl_Livro
order by Preço_Livro desc;

select Nome_Livro, Preço_Livro
from tbl_Livro
order by Preço_Livro asc;

-- CRIAÇÃO DE INDÍCES 
use db_Biblioteca; 
show index from tbl_editoras;

explain select 8 from tbl_editoras
where Nome_Editora = 'Springer';

create index idx_editora on tbl_editoras(Nome_Editora);  -- cria


drop index idx_editora on  tbl_editoras; -- exclui...

-- CLAÚSULA WHERE, PERMITE FILTRAR OS REGISTROS NAS COLUNAS ...

select Nome_Livro, Data_Pub
from tbl_Livro
where ID_Autor = 1;

select ID_Autor, Nome_Autor
from tbl_Autores
where Sobrenome_Autor = 'Stanek';


