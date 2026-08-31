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

-- OPERADORES LÓGICOS ,,, AND OR NOT

select *  from tbl_Livro
where ID_Livro > 2 and ID_Autor < 3;

select *  from tbl_Livro
where ID_Livro > 2 or ID_Autor < 3;

select *  from tbl_Livro
where ID_Livro > 2 and not ID_Autor < 3;

# FILTRANDO POR LISTAS COM  IN OU NOT IN...

use  db_Biblioteca;
# exemplo 1)
select Nome_Livro, ID_Editoras
from tbl_Livro
where ID_Editoras in(2,4);

#  Exemplo 2)
select Nome_Livro, ID_Editoras
from tbl_Livro
where ID_Editoras not in(2,4);

select  * from tbl_Livro;

# Exemplo  3)
select Nome_Livro,ID_Editoras
from tbl_Livro
where ID_Editoras in (
     select ID_Editoras
     from tbl_editoras
     where Nome_Editora = 'Wiley' or Nome_Editora = 'Microsoft Press'
     );
     # Consultando retorno 
     select Nome_Editora, ID_Editoras
     from tbl_editoras;
     

# Exclusão de dados da  tabela DELETE TRUNCATE

select * from tbl_teste_incremento;

delete from tbl_teste_incremento
where Codigo = 93;

# Zerando a  tabela  com TRUNCATE

truncate  table tbl_teste_incremento;


# SQL Alias

select Nome_Livro
as Livros
from tbl_Livro;

select Nome_Livro as Livros, Preço_Livro as Preço
from tbl_Livro;



# Função de Agregação...

select count(*) from tbl_Autores;

select count(*) as TotalAutores from tbl_Autores;

select count(distinct ID_Autor) from tbl_Livro;

select max(Preço_Livro) from tbl_Livro;

select min(Preço_Livro) from tbl_Livro;

select avg(Preço_Livro) from tbl_Livro;

select sum(Preço_Livro) from tbl_Livro;


# Renomeando tabelas
-- Criando  tabela....
create table Clientes (
ID_Cliente smallint,
Nome_Cliente varchar(20),
constraint primary key(ID_Cliente)
);

insert into Clientes (ID_Cliente, Nome_Cliente)
values (22, 'Leandro'),  (63,'Hoher'), (34, 'Oliver');
select  * from Meus_Clientes;

-- Renomeando a  tabela

rename table Clientes to Meus_Clientes;

select  * from Meus_Clientes;



#  Atualizando ou modificando Registros...

select  ID_Livro, Nome_Livro
from tbl_Livro;

update tbl_Livro
set Nome_Livro = 'SSH, o Shell Seguro'
where ID_Livro = 26;


# Seleção de Intervalos BETWEEN

select * from tbl_Livro
where Data_Pub between '20040101' and '20260101';

select * from tbl_Livro

where Data_Pub between '20000101' and '20040101';

select Nome_Livro as Livro, Preço_Livro as Preço from tbl_Livro
where Preço_Livro between 40.00 and 60.00;


# Busca de padrões e caracteres LIKE, NOT LIKE

select * from tbl_Livro
where Nome_Livro  like 'F%';

select * from tbl_Livro
where Nome_Livro not like 'S%';

select Nome_Livro
from tbl_Livro
where Nome_Livro like '_i%';


# Expressões Regulares REGEXP...alter

select Nome_Livro from tbl_Livro
where Nome_Livro regexp '^[FS]';

select Nome_Livro from tbl_Livro
where Nome_Livro regexp '^[^FS]';

select Nome_Livro from tbl_Livro
where Nome_Livro regexp '[pt]$';

select Nome_Livro from tbl_Livro
where Nome_Livro regexp '^[FS]|Mi';

select * from tbl_Livro;


# Usando valor Padrão....

select * from tbl_Autores;

alter table tbl_Autores
modify column Sobrenome_Autor varchar(60)
default 'Oliver';

insert into tbl_Autores (ID_Autor, Nome_Autor)
values (8, 'Leandro');

-- Especificando valor  padrão...

insert into tbl_Autores (ID_Autor, Nome_Autor, Sobrenome_Autor)
values (9, 'Blablabla', 'Mais');

# Retirando o valor Padrão....

alter table tbl_Autores
modify column Sobrenome_Autor varchar(60);

-- inserindo novo registro sem valor Padrão...
insert into tbl_Autores (ID_Autor, Nome_Autor)
values (10, 'Bla'); 
-- A coluna Nome_Autor terá o valor  NULL
select * From tbl_Autores;


# Fazendo BACKUP do Banco de Dados do Mysql via Terminal...

leandro@eu:~/leandro_dev/mysql$ mysqldump -u root -p db_Biblioteca > /home/leandro/leandro_dev/mysql/db_Biblioteca.sql
Enter password: 
leandro@eu:~/leandro_dev/mysql$ ls
db_Biblioteca.sql
leandro@eu:~/leandro_dev/mysql$ 


-- Restaurando BACKUP
# Criar novo  banco de dados...

create database teste_restore_backup;

-- Restaurando → Comandos via terminal:
leandro@eu:~/leandro_dev/mysql$ mysql -u root -p teste_restore_backup < /home/leandro/leandro_dev/mysql/db_Biblioteca.sql 
Enter password: 
leandro@eu:~/leandro_dev/mysql$ 

-- Usando Cláusula GROUP BY Agrupamento de Registros...

create  table Vendas (
ID smallint primary key,
Nome_Vendedor varchar(20),
Quantidade int,
Produto varchar(20),
Cidade varchar(20)
);

insert into Vendas (ID, Nome_Vendedor, Quantidade, Produto, Cidade)
values (10,'um',1400,'Mouse','Porto Alegre'),
(12,'dois',1220,'Teclado','Porto Alegre'),
(14,'tres',1700,'Teclado','Rio de Janeiro'),
(15,'quatro',2120,'Webcam','Recife'),
(18,'cinco',980,'Mouse','São Paulo'),
(19,'seis',1120,'Webcam','Recife'),
(22,'sete',3145,'Mouse','Porto Alegre');

select * from Vendas;

-- Filtrando  por produto:
select * from Vendas
where Produto = 'Mouse';


-- Consulta usando agregação para  obter total de vendas de Mouses:
select sum(Quantidade) as TotalMouses
from Vendas
where Produto = 'Mouse';

-- Consulta totalizando as vendas de todos os produtos por  cidade:
select Cidade, sum(Quantidade) as Total
from Vendas
group by Cidade;

select Cidade, count(*) as Total
from Vendas
group by Cidade;


select Cidade, sum(Quantidade) as Total
from Vendas
group by Cidade
having sum(Quantidade) < 2500

-- Criando VIEWS

create view vw_livrosAutores
as select tbl_Livro.Nome_Livro as Livro,
tbl_Autores.Nome_Autor as Autor
from tbl_Livro
inner join tbl_Autores
on tbl_Livro.ID_Autor = tbl_Autores.ID_Autor;

select Livro, Autor
from vw_livrosAutores
order by  Autor;

-- Alterando a VIEW: 

alter view vw_livrosAutores as
select tbl_Livro.Nome_Livro as Livro,
tbl_Autores.Nome_Autor as Autor, Preço_Livro as Valor
from tbl_Livro
inner join tbl_Autores
on tbl_Livro.ID_Autor = tbl_Autores.ID_Autor;

select *
from vw_livrosAutores
order by  Valor;

-- Excluir  uma VIEW...

drop view vw_livrosAutores;


-- Registros com correspondências em todas as tabelas INNER JOIN
select * from tbl_Livro
inner join tbl_Autores
on tbl_Livro.ID_Autor = tbl_Autores.ID_Autor;

select tbl_Livro.Nome_Livro, tbl_Livro.ISBN,  tbl_Autores.Nome_Autor
from tbl_Livro
inner join tbl_Autores
on tbl_Livro.ID_Autor = tbl_Autores.ID_Autor;

--  Usasndo alias e cláusulas  WHERE e LIKE:
select L.Nome_Livro as Livros, E.Nome_editora as Editoras
from tbl_Livro as L
inner  join tbl_editoras as E
on L.ID_Editoras = E.ID_Editoras
where E.Nome_Editora like 'M%';
  
-- Usando multiplas tabelas
select L.Nome_Livro as Livro, A.Nome_Autor as Autor,
E.Nome_Editora as Editora
from tbl_Livro as L
inner join tbl_Autores as A
on L.ID_Autor = A.ID_Autor
inner join tbl_editoras as E
on L.ID_Editoras = E.ID_Editoras;

select * from tbl_Autores
left join tbl_Livro
on tbl_Livro.ID_Autor = tbl_Autores.ID_Autor;


-- Filtrando por campos  especifícos:
select * from tbl_Autores
left join tbl_Livro
on tbl_Livro.ID_Autor = tbl_Autores.ID_Autor
where tbl_Livro.ID_Autor is null;

insert into tbl_editoras (ID_Editoras, Nome_Editora)
values(6, 'Companhia das Letras');

select * from tbl_editoras;

select * from tbl_Livro as Li
right join tbl_editoras as Ed
on Li.ID_Editoras = Ed.ID_Editoras;

-- Retorna apenas  seleção com campos nulos NULL 
select * from tbl_Livro as Li
right join tbl_editoras as Ed
on Li.ID_Editoras = Ed.ID_Editoras
where Li.ID_Editoras is null;


-- Concatanção de Strings CONCAT.... 

select concat(Nome_Autor, ' ', Sobrenome_Autor)
as 'Nome Completo' from tbl_Autores;

select concat('Em breve lerei o Livro:', Nome_Livro)
from tbl_Livro where ID_Autor = 2;

create table teste_nulos (
id smallint primary key auto_increment,
item varchar(20),
quantidade smallint null);

insert into teste_nulos (id, item, quantidade)
values (1, 'Pendrive', 5),(2, 'Monitor', 7), (3, 'Teclado', null);

select * from teste_nulos;

-- SE uma String for  concatenada com NULL, o resultado
-- retornado será NULL

select concat(' A quantidade adquirida é', ' ', quantidade)
from teste_nulos
where item = 'Teclado';

-- forma CORRETA IFNULL e COALESCE... 
select concat(' á quantidade  adquirida é', ' ', ifnull(quantidade, 0))
from teste_nulos
where item = 'Teclado'; 

-- Ou usando a função COALESCE.... 
select concat('Á quantidade adquirida é', ' ',
coalesce( null, quantidade, null, 0))
from teste_nulos
where item = 'Monitor';

-- operações Aritméticas... 
-- Exemplos
select 3 * 9;

select Nome_Livro, Preço_Livro * 5 as 'Preço de  5 Unidades'
from tbl_Livro;

-- Funções Matemáitcas... 
-- Exemplo.... 
select Nome_Livro, ceiling(Preço_Livro * 5) as 'Preço Arrendondado'
from tbl_Livro;

select pi();

select pow(2,4);

select sqrt(81);

select sin(pi());

select
 hex(1200);
 
select 2 * 9 / 3;

select Nome_Livro, Preço_Livro / 2  as 'Preço com 50% de desconto'
from tbl_Livro;

select 10 / 3;
select 10 mod 3;

-- Funcões e Procedimentos ... 
-- Criando a Função:
# Este formato gera erro de execução no SQL...
create function fn_teste (a decimal(10,2), b int) 
returns int
return a * b;

-- invocandoo a Função: 
select fn_teste(2.5, 4) as Resultado;

/* O Problema
O MySQL não consegue garantir a reprodutibilidade da sua função fn_teste sem essa classificação explícita. Como a função faz apenas uma multiplicação simples (a * b), ela é determinística (sempre retorna o mesmo resultado para os mesmos inputs) e não acessa o banco de dados (NO SQL). Essa é uma função segura e simples, mas a declaração atual não informa isso ao servidor.

A Solução
Você precisa adicionar as cláusulas DETERMINISTIC e NO SQL à sua declaração da função. Além disso, é uma boa prática definir o SQL SECURITY DEFINER para evitar problemas de permissão.

Aqui está a função corrigida:
*/
-- Garante que estamos no banco de dados correto
-- 1. Seleciona o banco de dados correto
USE db_Biblioteca;

-- 2. Tenta remover a função antiga (para evitar conflitos de nome)
DROP FUNCTION IF EXISTS fn_teste;

-- 3. Muda o delimitador para permitir a criação da função
DELIMITER $$

-- 4. Cria a função com as cláusulas de segurança obrigatórias
CREATE FUNCTION fn_teste (
    a DECIMAL(10,2), 
    b INT
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
SQL SECURITY DEFINER
BEGIN
    RETURN a * b;
END$$

-- 5. Restaura o delimitador padrão
DELIMITER ;

-- 6. Verifica se a função foi criada (Deve retornar 1 linha)
SHOW FUNCTION STATUS WHERE Db = 'db_Biblioteca' AND Name = 'fn_teste';

-- 7. Testa a função
SELECT fn_teste(2.5, 4) AS Resultado;


-- Criando procedimentos CREATE PROCEDURES....
-- Criando Procedimento:
create  procedure verPreço (varLivro smallint)
select concat('P preço é ', Preço_Livro) as Preço
from tbl_Livro
where ID_Livro = varLivro;

-- Invocando   o procedimento:
 call verPreço(25);
 
 -- Excluindo procedimento:
 drop procedure nome_procedimento;

drop procedure verPreço;


-- Criando a Função:
-- Bloco da função corrigido:

DELIMITER $$

CREATE FUNCTION aumenta_preço (
    preço DECIMAL(10,2), 
    taxa DECIMAL(10,2)
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
NO SQL
SQL SECURITY DEFINER
BEGIN
    -- Cálculo: Preço + (Preço * Taxa / 100)
    -- Exemplo: 50 + (50 * 10 / 100) = 50 + 5 = 55.00
   RETURN preço + (preço * taxa / 100);
END$$

DELIMITER ;

-- Invocação para aumentar o preço em 10%:
SELECT aumenta_preço(50.00, 10.00) AS Resultado;


-- Bloco Procedimento
## Bloco procedure CORRIGUDO:

DELIMITER $$

CREATE PROCEDURE verPreço (varLivro SMALLINT)
SQL SECURITY DEFINER
BEGIN
    -- Seleciona o preço do livro
    SELECT concat('O preço é ', CAST(Preço_Livro AS CHAR)) AS Preço
    FROM tbl_Livro
    WHERE ID_Livro = varLivro;
    
    -- Exibe mensagem de confirmação (usando SELECT para output)
    SELECT 'Procedimento executado com sucesso!' AS Mensagem;
END$$

DELIMITER ;

-- Invocando o procedimento:
CALL verPreço(26);


-- Parâmetro IN ... 
-- Exemplo 01:

DROP PROCEDURE IF EXISTS editora_livro;

DELIMITER $$

-- Remove o procedimento antigo para evitar conflitos
DROP PROCEDURE IF EXISTS editora_livro;

CREATE PROCEDURE editora_livro (IN editora_param VARCHAR(50))
SQL SECURITY DEFINER
BEGIN
    SELECT L.Nome_Livro, E.Nome_Editora
    FROM tbl_Livro AS L

    INNER JOIN tbl_editoras AS E
    ON L.ID_Editoras = E.ID_Editoras
    -- Corrigido: Nome_Editora (sem o 's' no final)
    WHERE E.Nome_Editora = editora_param;	
END$$

DELIMITER ;

CALL editora_livro('Wiley');

set @minhaeditora = 'Wiley'; -- Criando uma variável

call editora_livro(@minhaeditora);

G


-- Exemplo 2:

DELIMITER $$

CREATE PROCEDURE aumenta_preço( in codigo int, taxa decimal(10,2))
SQL SECURITY DEFINER
BEGIN
    update tbl_Livro
    set Preço_Livro = tbl_Livro.Preço_Livro + tbl_Livro.Preço_Livro * taxa / 100
    WHERE ID_Livro = codigo;	
END$$ 
DELIMITER ;
 -- Testando: aumentar o preço do livro de Id 4 em 20%:
 -- Primeiro verificação de preço atual:
 select * from tbl_Livro where ID_Livro = 26;
 -- aplicando o procedimtno de aumeneto:
 set @livro = 26;
  set @aumento = 20;
 call aumenta_preço(@livro, @aumento);
 
 select * from tbl_Livro where ID_Livro = 26;


-- Exemplo 3: Parâmetro OUT ,,, 

DELIMITER $$

CREATE PROCEDURE teste_out (in id int, out livro varchar(50))
SQL SECURITY DEFINER
BEGIN
     select Nome_Livro
     into livro
     from tbl_Livro
     where ID_Livro = id;
END$$ 
DELIMITER ;

call teste_out(26,@livro);
select @livro;

-- Confirmando o ID: 
select * from tbl_Livro;


-- Exemplo 3: Parâmetro OUT ,,, 

DELIMITER $$

CREATE PROCEDURE aumento(inout valor decimal(10,2), taxa decimal (10,2))
SQL SECURITY DEFINER
BEGIN
     set valor = valor + valor * taxa / 100;
END$$ 
DELIMITER ;
-- Testando criando a variável valorinicial, e a usamos
-- para passar o parâmetro valor, aumentanod em 15%:
set @valorinicial = 20.00;
select @valorinicial;

call aumento(@valorinicial, 15.00);
-- verificando se a variável externa valorinicial foi alterada:
select @valorinicial;


