use Romullus;

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
drop procedure ImoveisPorCidade;
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