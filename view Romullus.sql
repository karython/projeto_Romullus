IF OBJECT_ID('dbo.vw_DetalhesImovel', 'V') IS NOT NULL
    DROP VIEW dbo.vw_DetalhesImovel;
go
create view vw_DetalhesImovel
as
select 
	i.ID as ID_IMOVEL,
	Qtd_vaga, 
	Qtd_quarto, 
	Qtd_suite, 
	Qtd_banheiro, 
	Area_util, 
	Valor_imovel, 
	Observacoes,
	ti.NomeTipoImovel as Tipo_Imovel,
	en.Logradouro,
	en.Numero,
	en.Complemento,
	b.Nome_bairro as Bairro,
	c.Nome_cidade as Cidade,
	uf.Sigla_UF as Estado
	
from 
	imovel i
inner join
	TipoImovel ti
on i.fk_TipoImovel_ID = ti.ID
inner join 
	Endereco en
on i.fk_Endereco_ID = en.ID
inner join
	Bairro b
on en.fk_Bairro_ID = b.ID
inner join
	Cidade c
on b.fk_Cidade_ID = c.ID
inner join
	UF uf
on b.fk_Cidade_ID = uf.ID
;

select * from vw_DetalhesImovel where ID_IMOVEL = 3;