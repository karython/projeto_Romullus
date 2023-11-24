-- imoveis no estado de sao paulo
create view vw_ImoveisSP as
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
on i.fk_Endereco_ID = e.ID
join Bairro b
on e.fk_Bairro_ID = b.ID
join Cidade c
on b.fk_Cidade_ID = c.ID
join UF u
on c.fk_UF_ID = u.ID
where Nome_UF = 'São Paulo';

go
select * from vw_ImoveisSP
use Romullus;
-- imoveis no estado do Rio de Janeiro
create view vw_ImoveisRJ as
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
on i.fk_Endereco_ID = e.ID
join Bairro b
on e.fk_Bairro_ID = b.ID
join Cidade c
on b.fk_Cidade_ID = c.ID
join UF u
on c.fk_UF_ID = u.ID
where Nome_UF = 'Rio de Janeiro';

go

select * from vw_ImoveisSP
select * from vw_ImoveisRJ




-- quantidade de imoveis por cidade
SELECT Cidade.Nome_cidade, COUNT(Imovel.ID) as Quantidade
FROM Imovel
JOIN Endereco ON Imovel.fk_Endereco_ID = Endereco.ID
JOIN Bairro ON Endereco.fk_Bairro_ID = Bairro.ID
JOIN Cidade ON Bairro.fk_Cidade_ID = Cidade.ID
GROUP BY Cidade.Nome_cidade;

-- quantidade de imoveis por tipo de anuncio
SELECT TipoAnuncio.Nome_Tipo_Anuncio, COUNT(Imovel.ID) as Quantidade
FROM Imovel
JOIN TipoAnuncio ON Imovel.fk_TipoAnuncio_ID = TipoAnuncio.ID
GROUP BY TipoAnuncio.Nome_Tipo_Anuncio;

-- calcular a soma dos valores dos imóveis por tipo de imóvel
SELECT TipoImovel.NomeTipoImovel, SUM(Imovel.Valor_imovel) as Soma_Valor
FROM Imovel
JOIN TipoImovel ON Imovel.fk_TipoImovel_ID = TipoImovel.ID
GROUP BY TipoImovel.NomeTipoImovel;

-- mostrar todos os detalhes de um imovel
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

