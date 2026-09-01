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