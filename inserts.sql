-- Inser��es adicionais para a tabela Imovel
INSERT INTO Imovel (Qtd_vaga, Qtd_quarto, Qtd_suite, Qtd_banheiro, Area_util, Valor_imovel, Observacoes, fk_TipoImovel_ID, fk_Endereco_ID, fk_TipoAnuncio_ID) VALUES 
(2, 2, 1, 2, 90, 350000.00, 'Linda vista para o mar', 1, 11, 1),
(1, 3, 1, 2, 150, 600000.00, 'Piscina privativa e �rea de churrasco', 2, 12, 2),
(3, 1, 2, 1, 75, 200000.00, 'Apartamento mobiliado', 3, 13, 3),
(0, 2, 1, 1, 50, 120000.00, 'Compacto e aconchegante', 4, 14, 4),
(2, 4, 2, 3, 180, 900000.00, 'Casa moderna com jardim espa�oso', 5, 15, 5);

INSERT INTO Imovel (Qtd_vaga, Qtd_quarto, Qtd_suite, Qtd_banheiro, Area_util, Valor_imovel, Observacoes, fk_TipoImovel_ID, fk_Endereco_ID, fk_TipoAnuncio_ID) VALUES 
(2, 3, 1, 2, 120, 450000.00, 'Apartamento com varanda gourmet', 1, 16, 2),
(1, 4, 2, 3, 200, 800000.00, 'Casa com piscina e espa�o de lazer', 2, 17, 1),
(3, 2, 1, 1, 80, 250000.00, '�tima localiza��o no centro da cidade', 3, 18, 3),
(0, 1, 0, 1, 60, 150000.00, 'Terreno plano pronto para construir', 4, 19, 4),
(0, 0, 0, 0, 1000, 1200000.00, 'Ch�cara com ampla �rea verde', 5, 20, 5);

-- Inser��es adicionais para a tabela Imagem
INSERT INTO Imagem (Nome_Imagem, url, fk_Imovel_ID) VALUES 
('Imagem11.jpg', '/images/imovel10', 6),
('Imagem12.jpg', '/images/imovel11', 7),
('Imagem13.jpg', '/images/imovel12', 8),
('Imagem14.jpg', '/images/imovel13', 9),
('Imagem15.jpg', '/images/imovel14', 10);

-- Inser��es adicionais para a tabela Imovel
INSERT INTO Imovel (Qtd_vaga, Qtd_quarto, Qtd_suite, Qtd_banheiro, Area_util, Valor_imovel, Observacoes, fk_TipoImovel_ID, fk_Endereco_ID, fk_TipoAnuncio_ID) VALUES 
(1, 2, 1, 1, 70, 280000.00, 'Apartamento pr�ximo ao metr�', 6, 1, 3),
(2, 3, 1, 2, 130, 550000.00, 'Casa com piscina e jardim', 7, 2, 1),
(0, 1, 0, 1, 40, 180000.00, 'Est�dio mobiliado', 8, 3, 2),
(1, 1, 1, 1, 60, 200000.00, 'Escrit�rio comercial', 9, 4, 4),
(0, 0, 0, 0, 800, 3500000.00, 'Terreno para desenvolvimento residencial', 10, 5, 5);

-- Inser��es adicionais para a tabela Imagem
INSERT INTO Imagem (Nome_Imagem, url, fk_Imovel_ID) VALUES 
('Imagem16.jpg', '/images/imovel15', 11),
('Imagem17.jpg', '/images/imovel16', 12),
('Imagem18.jpg', '/images/imovel17', 13),
('Imagem19.jpg', '/images/imovel18', 14),
('Imagem20.jpg', '/images/imovel19', 15);

-- Inser��es adicionais para a tabela UF
INSERT INTO UF (Nome_UF, Sigla_UF) VALUES 
('Cear�', 'CE'),
('Pernambuco', 'PE'),
('Goi�s', 'GO'),
('Esp�rito Santo', 'ES'),
('Par�', 'PA');
select * from UF
select * from Cidade
-- Inser��es adicionais para a tabela Cidade
INSERT INTO Cidade (Nome_cidade, fk_UF_ID) VALUES 
('Fortaleza', 11),
('Recife', 12),
('Goi�nia', 13),
('Vit�ria', 14),
('Bel�m', 15);

-- Inser��es adicionais para a tabela Bairro
INSERT INTO Bairro (Nome_bairro, fk_Cidade_ID) VALUES 
('Aldeota', 16),
('Boa Viagem', 17),
('Setor Bueno', 18),
('Jardim Camburi', 19),
('Nazar�', 20);
select * from Bairro
-- Inser��es adicionais para a tabela Endereco
INSERT INTO Endereco (Logradouro, Numero, Complemento, fk_Bairro_ID) VALUES 
('Rua Padre Valdevino', 150, 'Apto 302', 16),
('Av. Boa Viagem', 500, 'Cobertura', 17),
('Rua T-38', 200, 'Casa Amarela', 18),
('Av. Leit�o da Silva', 1200, 'Condom�nio ABC', 19),
('Av. Governador Jos� Malcher', 50, 'Bloco D', 20);

-- Inser��es adicionais para a tabela Endereco
INSERT INTO Endereco (Logradouro, Numero, Complemento, fk_Bairro_ID) VALUES 
('Av. Dom Lu�s', 250, 'Apto 501', 16),
('Rua dos Navegantes', 300, 'Casa Verde', 17),
('Rua 90', 100, 'Casa Azul', 18),
('Rua Jo�o da Cruz', 800, 'Condom�nio XYZ', 19),
('Travessa Jer�nimo Pimentel', 80, 'Bloco E', 20);

-- Inser��es adicionais para a tabela Endereco
INSERT INTO Endereco (Logradouro, Numero, Complemento, fk_Bairro_ID) VALUES 
('Av. Desembargador Moreira', 180, 'Apto 401', 16),
('Rua do Futuro', 400, 'Casa Amarela', 17),
('Rua T-55', 150, 'Casa Branca', 18),
('Av. Vit�ria', 1100, 'Condom�nio DEF', 19),
('Rua dos Tupinamb�s', 120, 'Bloco F', 20);
select * from Endereco