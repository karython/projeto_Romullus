create procedure AlteraSenha
@UsuarioID int,
@NovaSenha varchar(32)
as
begin

update Usuario 
set Senha = @NovaSenha 
where Usuario.ID = @UsuarioID;

end;

exec AlteraSenha @UsuarioID = 2, @NovaSenha = '123@123@45';

/*-------------------------------------------------------------------------------------------------*/
go
create procedure ImoveisPorCidade
@CidadeID int
as
begin
	select i.ID,  i.Valor_imovel
	from Imovel i
	join Endereco e
	on i.fk_Endereco_ID = e.ID
	join Bairro b
	on e.fk_Bairro_ID = b.ID
	join Cidade c
	on b.fk_Cidade_ID = c.ID
	join UF u
	on c.fk_UF_ID = u.ID
	where c.ID = @CidadeID;
end;

exec ImoveisPorCidade @CidadeID = 2;

go

/*Calcula total de imoveis atraves do tipo de imovel*/
create function CalculaPorTipo(@TipoID int)
returns decimal (10,2)
as
begin
	declare @ValorTotal decimal;

	select @ValorTotal = sum(Valor_imovel)
	from Imovel
	where fk_TipoImovel_ID = @TipoID;

	return @ValorTotal;
end;
go

select dbo.CalculaPorTipo (1) as ValorTotal;

go

/*------------------------ AULA 21/11 ------------------------*/
create procedure ImagensPorImovel
@imovelID int

as
begin
	select *
	from Imagem
	where fk_Imovel_ID = @imovelID
end;

execute ImagensPorImovel @imovelID = 3;
GO
use Romullus
/*----------------- IMOVEIS POR TIPO DE ANUNCIO ---------------*/
create procedure ImoveisPorTipo
@imovelID int
as
begin
	select *
	from Imovel
	where fk_TipoAnuncio_ID = @imovelID;
end;

exec ImoveisPorTipo @imovelID = 4;
GO

-- para o dia 22/11
/*---------------- AUMENTO -----------------*/
create procedure AumentoPorArea
@FatordeAumento decimal
as
begin
	update Imovel
	set Valor_imovel = Valor_imovel * @FatordeAumento;
end;

exec AumentoPorArea @FatordeAumento = 1.5;

select * from imovel;
GO

create procedure InserirUsuarios
@Nome varchar (120),
@Senha nchar(32),
@email varchar (120),
@fk int
as
begin
	insert into Usuario (Nome, Senha, DataHoraCrianao, DataHoraUltimoAcesso, email,fk_TipoUsuario_ID)
	values (@Nome, @Senha, GETDATE(), GETDATE(), @email, @fk);
end;
go
exec InserirUsuarios @Nome = 'Jose', @Senha = '456@@123', @email = 'email123@', @fk = 2;

select * from Usuario;










go
/*----------- DELETA IMOVEL POR CIDADE ---------------------*/
create procedure DeletaPorCidade
@CidadeID int
as
begin
	delete from Imovel
	where fk_Endereco_ID IN 
	(select ID from Endereco where fk_Bairro_ID IN 
	(select ID from Bairro where fk_Cidade_ID = @CidadeID));;
end;

<<<<<<< HEAD
EXEC DeletaPorCidade @CidadeID = 1;
use Romullus
SELECT * FROM Cidade;
=======
EXEC DeletaPorCidade @CidadeID = 2;


go

create view vw_DetalhesImovelSP as
select
	i.ID,
	i.Valor_imovel,
	e.Logradouro,
	e.Numero,
	b.Nome_bairro,
	c.Nome_cidade,
	u.Nome_UF 
from Imovel i
join Endereco e
on  i.fk_Endereco_ID = e.ID
join Bairro b
on e.fk_Bairro_ID = b.ID
join Cidade c
on b.fk_Cidade_ID = c.ID
join UF u
on c.fk_UF_ID = u.ID
where Nome_UF = 'S�o Paulo';
go


select * from vw_DetalhesImovelSP;









<<<<<<< HEAD
=======
>>>>>>> 5187e0e53e41cb0160a55adaad54bbe61eb46bc0

>>>>>>> b2f1718f20ae6b44aad6c4a7e8509791ca8f7dbd
