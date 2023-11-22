
create procedure ImagensPorImovel
@imovelID int
as
begin
	select * from Imagem
	where fk_Imovel_ID = @imovelID;
end;

go

execute ImagensPorImovel @ImovelID = 5;
go

create procedure InserirLogin
@ID int,
@email varchar(120),
@senha varchar(120)
as
begin
	insert into Login (ID, Email, Senha)
	values (@ID, @email, @senha);
end;


exec InserirLogin @ID = 1, @email = 'emai123', @senha = '123asd';


go


create procedure InserirLog
@id int,
@email varchar (120),
@senha varchar(32),
@fkUsuario int
as
begin
	insert into Login (ID, Email, Senha, ID_Usuario)
	Values (@id, @email, @senha, @fkUsuario);
end;

go

exec InserirLog @id = 5,
@email = 'emai321', @senha = '123asd456', @fkUsuario = 1;

select * from Imovel;
select * from Login;
delete from Login;

go

create procedure AlterSenha
@id int,
@novaSenha varchar(32)
as
begin
	update Usuario set Senha = @novaSenha where ID = @id;
end;

exec AlterSenha @id = 1, @novaSenha = 'novasenha';

select * from Usuario; 




go --inicia um novo bloco de procedure
create procedure DeletLog
@id int --diferenciar uma variavel de uma coluna
as
begin -- inicio do scopo
	delete from Login --funcionalidade da procedure
	where id = @id;
end; --final do scopo

go
exec DeletLog @id = 1; -- chama a procedure e recebe o id