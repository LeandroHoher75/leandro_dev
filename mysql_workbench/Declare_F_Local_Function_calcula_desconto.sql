-- Exemplo com SELECt... INTO ( o desconto será dado diretamente
-- em reais,não porcentagem; os comandos devem ser ajustados 
-- para retornar apenas uma linha no SELECT ..INTO):
use db_Biblioteca;

delimiter //
create function calcula_desconto(livro int, desconto decimal(10,2))
returns decimal(10,2)
deterministic
no sql
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