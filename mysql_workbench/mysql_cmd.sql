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

-- Exemplo com SELECt... INTO ( o desconto será dado diretamente
-- em reais,não porcentagem; os comandos devem ser ajustados 
-- para retornar apenas uma linha no SELECT ..INTO):
use db_Biblioteca;

delimiter //
create function calcula_desconto(livro int, desconto decimal(10,2))
returns decimal(10,2)
deterministic
n-- Exemplo com bloco IF ... 
delimiter //
create function  calcula_imposto(salario decimal(8,2))
returns decimal(8,2)
deterministic
no sql
sql security definer
begin
    declare valor_imposto dec(8,2);
    if salario < 1000.00 then
       set valor_imposto = 0.00;
    elseif salario < 2000.00 then
       set valor_imposto = salario * 0.15;
    elseif salario < 3000.00 then
       set valor_imposto = salario * 0.22;
     else
       set valor_imposto = salario * 0.27;
       end if;
       return valor_imposto;     
end //
delimiter ;
-- Testando passndo valores de salários como parâmetro
-- Usando valores como 850, 1200 e 6000 para testes:
select calcula_imposto(6000.00);

use db_Biblioteca;
-- Exemplo 2 ... 
delimiter //
create function  calcula_imposto_case(salario decimal(8,2))
returns decimal(8,2)
deterministic
no sql
sql security definer
begin
    declare valor_imposto decimal(8,2);
    case
    when salario < 1000.00 then
       set valor_imposto = 0.00;
    when salario < 2000.00 then
       set valor_imposto = salario * 0.15;
    when salario < 3000.00 then
       set valor_imposto = salario * 0.22;
     else
       set valor_imposto = salario * 0.27;
       end case;
       return valor_imposto;     
end //
delimiter ;
select calcula_imposto_case(4600.00);o sql
sql security definer
begin
    declare preço decimal(10,2);
    select Preço_Livro from tbl_Livro
    where ID_Livro = livro into preço;
    return preço - desconto;
    
end //
delimiter ;
 -- Testando com o livro de ID 24 e desconto de R$10,00:
 
 select * from tbl_Livro where ID_Livro = 26;
 select calcula_desconto(26, 10.00);
 
 select * from tbl_Livro where ID_Livro = 26;


-- Exemplo com bloco IF ... 
delimiter //
create function  calcula_imposto(salario decimal(8,2))
returns decimal(8,2)
deterministic
no sql
sql security definer
begin
    declare valor_imposto dec(8,2);
    if salario < 1000.00 then
       set valor_imposto = 0.00;
    elseif salario < 2000.00 then
       set valor_imposto = salario * 0.15;
    elseif salario < 3000.00 then
       set valor_imposto = salario * 0.22;
     else
       set valor_imposto = salario * 0.27;
       end if;
       return valor_imposto;     
end //
delimiter ;
-- Testando passndo valores de salários como parâmetro
-- Usando valores como 850, 1200 e 6000 para testes:
select calcula_imposto(6000.00);

use db_Biblioteca;
-- Exemplo 2 ... 
delimiter //
create function  calcula_imposto_case(salario decimal(8,2))
returns decimal(8,2)
deterministic
no sql
sql security definer
begin
    declare valor_imposto decimal(8,2);
    case
    when salario < 1000.00 then
       set valor_imposto = 0.00;
    when salario < 2000.00 then
       set valor_imposto = salario * 0.15;
    when salario < 3000.00 then
       set valor_imposto = salario * 0.22;
     else
       set valor_imposto = salario * 0.27;
       end case;
       return valor_imposto;     
end //
delimiter ;
select calcula_imposto_case(4600.00);


# Acessando via liinha  de comando o mysql


mysql> show databases;
+----------------------+
| Database             |
+----------------------+
| db_Biblioteca        |
| information_schema   |
| mysql                |
| performance_schema   |
| sys                  |
| teste_restore_backup |
+----------------------+
6 rows in set (0,01 sec)

mysql> 
mysql> use db_Biblioteca;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------------+
| Tables_in_db_Biblioteca |
+-------------------------+
| Meus_Clientes           |
| Vendas                  |
| tbl_Autores             |
| tbl_Livro               |
| tbl_editoras            |
| tbl_teste_incremento    |
| teste_nulos             |
| vw_livrosAutores        |
+-------------------------+
8 rows in set (0,01 sec)

mysql> show create table  tbl_Livro;
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table     | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| tbl_Livro | CREATE TABLE `tbl_Livro` (
  `ID_Livro` smallint NOT NULL AUTO_INCREMENT,
  `Nome_Livro` varchar(50) NOT NULL,
  `ISBN` varchar(30) NOT NULL,
  `Data_Pub` date NOT NULL,
  `Preço_Livro` decimal(10,0) NOT NULL,
  `ID_Autor` smallint NOT NULL,
  `ID_Editoras` smallint NOT NULL,
  PRIMARY KEY (`ID_Livro`),
  KEY `fk_ID_Autor` (`ID_Autor`),
  KEY `fk_ID_Editoras` (`ID_Editoras`),
  CONSTRAINT `fk_ID_Autor` FOREIGN KEY (`ID_Autor`) REFERENCES `tbl_Autores` (`ID_Autor`),
  CONSTRAINT `fk_ID_Editoras` FOREIGN KEY (`ID_Editoras`) REFERENCES `tbl_editoras` (`ID_Editoras`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci  |
+-----------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0,03 sec)

mysql> 

mysql> show create procedure verPreço;
+-----------+-----------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| Procedure | sql_mode                                                                                                              | Create Procedure                                                                                                                                                          | character_set_client | collation_connection | Database Collation |
+-----------+-----------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| verPreço  | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | CREATE DEFINER=`root`@`localhost` PROCEDURE `verPreço`(varLivro smallint)
select concat('P preço é ', Preço_Livro) as Preço
from tbl_Livro
where ID_Livro = varLivro      | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
+-----------+-----------------------------------------------------------------------------------------------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
1 row in set (0,03 sec)

mysql> 

mysql> show create function calcula_desconto;
+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| Function         | sql_mode                                                                                                              | Create Function                                                                                                                                                                                                                                                                                                   | character_set_client | collation_connection | Database Collation |
+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
| calcula_desconto | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION | CREATE DEFINER=`root`@`localhost` FUNCTION `calcula_desconto`(livro int, desconto decimal(10,2)) RETURNS decimal(10,2)
    NO SQL
    DETERMINISTIC
begin
    declare preço decimal(10,2);
    select Preço_Livro from tbl_Livro
    where ID_Livro = livro into preço;
    return preço - desconto;
    
end     | utf8mb4              | utf8mb4_0900_ai_ci   | utf8mb4_0900_ai_ci |
+------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+--------------------+
1 row in set (0,00 sec)

mysql> 

mysql> 
mysql> show columns from tbl_editoras;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| ID_Editoras  | smallint    | NO   | PRI | NULL    | auto_increment |
| Nome_Editora | varchar(50) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
2 rows in set (0,04 sec)

mysql>

mysql> show columns from tbl_Livro;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| ID_Livro     | smallint      | NO   | PRI | NULL    | auto_increment |
| Nome_Livro   | varchar(50)   | NO   |     | NULL    |                |
| ISBN         | varchar(30)   | NO   |     | NULL    |                |
| Data_Pub     | date          | NO   |     | NULL    |                |
| Preço_Livro  | decimal(10,0) | NO   |     | NULL    |                |
| ID_Autor     | smallint      | NO   | MUL | NULL    |                |
| ID_Editoras  | smallint      | NO   | MUL | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
7 rows in set (0,01 sec)

mysql> show columns from tbl_Livro like 'I%';
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| ID_Livro    | smallint    | NO   | PRI | NULL    | auto_increment |
| ISBN        | varchar(30) | NO   |     | NULL    |                |
| ID_Autor    | smallint    | NO   | MUL | NULL    |                |
| ID_Editoras | smallint    | NO   | MUL | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+
4 rows in set (0,00 sec)

mysql>


mysql> show columns from tbl_Livro where type like 'varchar%';
+------------+-------------+------+-----+---------+-------+
| Field      | Type        | Null | Key | Default | Extra |
+------------+-------------+------+-----+---------+-------+
| Nome_Livro | varchar(50) | NO   |     | NULL    |       |
| ISBN       | varchar(30) | NO   |     | NULL    |       |
+------------+-------------+------+-----+---------+-------+
2 rows in set (0,01 sec)

mysql> show grants for  root@localhost;
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Grants for root@localhost                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE, CREATE ROLE, DROP ROLE ON *.* TO `root`@`localhost` WITH GRANT OPTION                                                                                                                                                                                                                                                                                                                                                                                     |
| GRANT APPLICATION_PASSWORD_ADMIN,AUDIT_ABORT_EXEMPT,AUDIT_ADMIN,AUTHENTICATION_POLICY_ADMIN,BACKUP_ADMIN,BINLOG_ADMIN,BINLOG_ENCRYPTION_ADMIN,CLONE_ADMIN,CONNECTION_ADMIN,ENCRYPTION_KEY_ADMIN,FIREWALL_EXEMPT,FLUSH_OPTIMIZER_COSTS,FLUSH_STATUS,FLUSH_TABLES,FLUSH_USER_RESOURCES,GROUP_REPLICATION_ADMIN,GROUP_REPLICATION_STREAM,INNODB_REDO_LOG_ARCHIVE,INNODB_REDO_LOG_ENABLE,PASSWORDLESS_USER_ADMIN,PERSIST_RO_VARIABLES_ADMIN,REPLICATION_APPLIER,REPLICATION_SLAVE_ADMIN,RESOURCE_GROUP_ADMIN,RESOURCE_GROUP_USER,ROLE_ADMIN,SENSITIVE_VARIABLES_OBSERVER,SERVICE_CONNECTION_ADMIN,SESSION_VARIABLES_ADMIN,SET_USER_ID,SHOW_ROUTINE,SYSTEM_USER,SYSTEM_VARIABLES_ADMIN,TABLE_ENCRYPTION_ADMIN,TELEMETRY_LOG_ADMIN,XA_RECOVER_ADMIN ON *.* TO `root`@`localhost` WITH GRANT OPTION |
| GRANT PROXY ON ``@`` TO `root`@`localhost` WITH GRANT OPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
3 rows in set (0,02 sec)


mysql> describe tbl_Livro;
+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| ID_Livro     | smallint      | NO   | PRI | NULL    | auto_increment |
| Nome_Livro   | varchar(50)   | NO   |     | NULL    |                |
| ISBN         | varchar(30)   | NO   |     | NULL    |                |
| Data_Pub     | date          | NO   |     | NULL    |                |
| Preço_Livro  | decimal(10,0) | NO   |     | NULL    |                |
| ID_Autor     | smallint      | NO   | MUL | NULL    |                |
| ID_Editoras  | smallint      | NO   | MUL | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+
7 rows in set (0,03 sec)


# Acessando  informação do conteúdo banco de dadoos via prompt  do terminal...

leandro@eu:~/leandro_dev/mysql_workbench$ mysqlshow -u root -p
Enter password: 
+----------------------+
|      Databases       |
+----------------------+
| db_Biblioteca        |
| information_schema   |
| mysql                |
| performance_schema   |
| sys                  |
| teste_restore_backup |
+----------------------+

leandro@eu:~/leandro_dev/mysql_workbench$ mysqlshow -u root -p db_Biblioteca

Enter password: 

Database: db_Biblioteca
+----------------------+
|        Tables        |
+----------------------+
| Meus_Clientes        |
| Vendas               |
| tbl_Autores          |
| tbl_Livro            |
| tbl_editoras         |
| tbl_teste_incremento |
| teste_nulos          |
| vw_livrosAutores     |
+----------------------+

-- Estruturas de repetição LOOP ... 

DELIMITER $$
    
CREATE PROCEDURE acumula (limite int)
SQL SECURITY DEFINER
BEGIN
     declare contador int  default 0;
     declare soma int default 0;
     loop_teste: loop
           set contador = contador + 1;
           set soma = soma + contador;
           if contador >= limite then
              leave loop_teste;
           end if;
        end loop loop_teste;
        select soma;
END$$
DELIMITER ;

--  Testando ... 
call acumula(100  );
