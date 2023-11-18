create database Romullus;
use Romullus;

CREATE TABLE Usuario (
    ID int PRIMARY KEY identity (1,1),
    Nome varchar(120),
    Senha varchar(32),
    DataHoraCrianao datetime,
    DataHoraUltimoAcesso datetime,
    email varchar(120),
    fk_TipoUsuario_ID int
);

CREATE TABLE TipoUsuario (
    ID int PRIMARY KEY identity (1,1),
    Tipo varchar(80)
);

CREATE TABLE Cidade (
    Nome_cidade varchar(60),
    ID int PRIMARY KEY identity (1,1),
    fk_UF_ID int
);

CREATE TABLE Bairro (
    ID int PRIMARY KEY identity (1,1),
    Nome_bairro varchar(60),
    fk_Cidade_ID int
);

CREATE TABLE UF (
    ID int PRIMARY KEY identity (1,1),
    Nome_UF varchar(120),
    Sigla_UF char(2)
);

CREATE TABLE Endereco (
    ID int PRIMARY KEY identity (1,1),
    Logradouro varchar(120),
    Numero int,
    Complemento varchar(120),
    fk_Bairro_ID int
);

CREATE TABLE TipoAnuncio (
    ID int PRIMARY KEY identity (1,1),
    Nome_Tipo_Anuncio varchar(30)
);

CREATE TABLE Imovel (
    Qtd_vaga int,
    Qtd_quarto int,
    Qtd_suite int,
    Qtd_banheiro int,
    Area_util int,
    Valor_imovel decimal,
    ID int PRIMARY KEY identity (1,1),
    Observacoes text,
    fk_TipoImovel_ID int,
    fk_Endereco_ID int,
    fk_TipoAnuncio_ID int
);

CREATE TABLE TipoImovel (
    ID int PRIMARY KEY identity (1,1),
    NomeTipoImovel varchar(80)
);

CREATE TABLE Imagem (
    ID int PRIMARY KEY identity (1,1),
    Nome_Imagem varchar(120),
    url varchar(80),
    fk_Imovel_ID int
);

CREATE TABLE Login (
    ID int PRIMARY KEY identity (1,1),
    Email varchar(120),
    Senha varchar(32),
    ID_Usuario int
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_TipoUsuario_ID)
    REFERENCES TipoUsuario (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Cidade ADD CONSTRAINT FK_Cidade_2
    FOREIGN KEY (fk_UF_ID)
    REFERENCES UF (ID)
    ON DELETE cascade;
 
ALTER TABLE Bairro ADD CONSTRAINT FK_Bairro_2
    FOREIGN KEY (fk_Cidade_ID)
    REFERENCES Cidade (ID)
    ON DELETE cascade;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (fk_Bairro_ID)
    REFERENCES Bairro (ID)
    ON DELETE cascade;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_2
    FOREIGN KEY (fk_TipoImovel_ID)
    REFERENCES TipoImovel (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_3
    FOREIGN KEY (fk_Endereco_ID)
    REFERENCES Endereco (ID)
    ON DELETE cascade;
 
ALTER TABLE Imovel ADD CONSTRAINT FK_Imovel_4
    FOREIGN KEY (fk_TipoAnuncio_ID)
    REFERENCES TipoAnuncio (ID)
    ON DELETE CASCADE;
 
ALTER TABLE Imagem ADD CONSTRAINT FK_Imagem_2
    FOREIGN KEY (fk_Imovel_ID)
    REFERENCES Imovel (ID)
    ON DELETE cascade;
 
ALTER TABLE Login ADD CONSTRAINT FK_Login_2
    FOREIGN KEY (ID_Usuario)
    REFERENCES Usuario (ID);

-- Inserções para a tabela TipoUsuario
INSERT INTO TipoUsuario (Tipo) VALUES 
('Administrador'),
('Usuário Padrão'),
('Visitante'),
('Editor'),
('Moderador');

-- Inserções para a tabela UF
INSERT INTO UF (Nome_UF, Sigla_UF) VALUES 
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Minas Gerais', 'MG'),
('Bahia', 'BA'),
('Paraná', 'PR');

-- Inserções para a tabela Cidade
INSERT INTO Cidade (Nome_cidade, fk_UF_ID) VALUES 
('São Paulo', 1),
('Rio de Janeiro', 2),
('Belo Horizonte', 3),
('Salvador', 4),
('Curitiba', 5);

-- Inserções para a tabela Bairro
INSERT INTO Bairro (Nome_bairro, fk_Cidade_ID) VALUES 
('Vila Olímpia', 1),
('Copacabana', 2),
('Funcionários', 3),
('Barra', 4),
('Batel', 5);

-- Inserções para a tabela Endereco
INSERT INTO Endereco (Logradouro, Numero, Complemento, fk_Bairro_ID) VALUES 
('Av. Faria Lima', 100, 'Sala 501', 1),
('Av. Atlântica', 500, 'Apto 1201', 2),
('Rua da Bahia', 300, 'Casa Amarela', 3),
('Av. Tancredo Neves', 1200, 'Condomínio XYZ', 4),
('Rua Buenos Aires', 150, 'Bloco C', 5);

-- Inserções para a tabela TipoAnuncio
INSERT INTO TipoAnuncio (Nome_Tipo_Anuncio) VALUES 
('Venda'),
('Aluguel'),
('Temporada'),
('Permuta'),
('Leilão');

-- Inserções para a tabela TipoImovel
INSERT INTO TipoImovel (NomeTipoImovel) VALUES 
('Apartamento'),
('Casa'),
('Sobrado'),
('Terreno'),
('Chácara');

-- Inserções para a tabela Imovel
INSERT INTO Imovel (Qtd_vaga, Qtd_quarto, Qtd_suite, Qtd_banheiro, Area_util, Valor_imovel, Observacoes, fk_TipoImovel_ID, fk_Endereco_ID, fk_TipoAnuncio_ID) VALUES 
(2, 3, 1, 2, 120, 450000.00, 'Linda vista para a cidade', 1, 1, 2),
(1, 4, 2, 3, 200, 800000.00, 'Piscina e área de lazer completa', 2, 2, 1),
(3, 2, 1, 1, 80, 250000.00, 'Ótima localização', 3, 3, 3),
(0, 1, 0, 1, 60, 150000.00, 'Terreno plano pronto para construir', 4, 4, 4),
(0, 0, 0, 0, 1000, 1200000.00, 'Ampla área verde, ideal para eventos', 5, 5, 5);

INSERT INTO Imovel (Qtd_vaga, Qtd_quarto, Qtd_suite, Qtd_banheiro, Area_util, Valor_imovel, Observacoes, fk_TipoImovel_ID, fk_Endereco_ID, fk_TipoAnuncio_ID) VALUES 
(2, 3, 1, 2, 120, 450000.00, 'Linda vista para a cidade', 1, 2, 2),
(2, 3, 1, 2, 120, 450000.00, 'Ampla área verde, ideal para eventos', 1, 3, 2),
(2, 3, 1, 2, 120, 450000.00, 'Ótima localização', 1, 2, 2),
(2, 3, 1, 2, 120, 450000.00, 'Ótima localização', 1, 3, 2);



-- Inserções para a tabela Imagem
INSERT INTO Imagem (Nome_Imagem, url, fk_Imovel_ID) VALUES 
('Imagem1.jpg', '/images/imovel1', 1),
('Imagem2.jpg', '/images/imovel1', 1),
('Imagem3.jpg', '/images/imovel2', 2),
('Imagem4.jpg', '/images/imovel3', 3),
('Imagem5.jpg', '/images/imovel4', 4);

-- Inserções para a tabela Usuario
INSERT INTO Usuario ( Nome, Senha, DataHoraCrianao, DataHoraUltimoAcesso, email, fk_TipoUsuario_ID) VALUES 
( 'Admin', 'admin123', GETDATE(), GETDATE(), 'admin@example.com', 1),
( 'Usuario1', 'userpass', GETDATE(), GETDATE(), 'user1@example.com', 2),
( 'Usuario2', 'userpass', GETDATE(), GETDATE(), 'user2@example.com', 2),
( 'Editor1', 'editorpass', GETDATE(), GETDATE(), 'editor1@example.com', 4),
( 'Moderador1', 'modpass', GETDATE(), GETDATE(), 'mod1@example.com', 5);

-- Inserções para a tabela Login
INSERT INTO Login ( Email, Senha, ID_Usuario) VALUES 
( 'admin@example.com', 'admin123', 1),
( 'user1@example.com', 'userpass', 2),
('user2@example.com', 'userpass', 3),
( 'editor1@example.com', 'editorpass', 4),
( 'mod1@example.com', 'modpass', 5);


-- Inserções adicionais para a tabela TipoUsuario
INSERT INTO TipoUsuario (Tipo) VALUES 
('Corretor'),
('Proprietário'),
('Visitante Frequente'),
('Editor Chefe'),
('Moderador Sênior');

-- Inserções adicionais para a tabela UF
INSERT INTO UF (Nome_UF, Sigla_UF) VALUES 
('Rio Grande do Sul', 'RS'),
('Santa Catarina', 'SC'),
('Pará', 'PA'),
('Amazonas', 'AM'),
('Mato Grosso', 'MT');

-- Inserções adicionais para a tabela Cidade
INSERT INTO Cidade (Nome_cidade, fk_UF_ID) VALUES 
('Porto Alegre', 6),
('Florianópolis', 7),
('Belém', 8),
('Manaus', 9),
('Cuiabá', 10);

-- Inserções adicionais para a tabela Bairro
INSERT INTO Bairro (Nome_bairro, fk_Cidade_ID) VALUES 
('Moinhos de Vento', 6),
('Centro', 7),
('Nazaré', 8),
('Parque 10', 9),
('Araés', 10);

-- Inserções adicionais para a tabela Endereco
INSERT INTO Endereco (Logradouro, Numero, Complemento, fk_Bairro_ID) VALUES 
('Rua Padre Chagas', 200, 'Apto 301', 7),
('Rua Felipe Schmidt', 300, 'Casa Azul', 8),
('Av. Governador Magalhães Barata', 150, 'Casa Amarela', 2),
('Av. Constantino Nery', 500, 'Condomínio ABC', 10),
('Rua das Amendoeiras', 50, 'Bloco D', 3);

-- Inserções adicionais para a tabela TipoAnuncio
INSERT INTO TipoAnuncio (Nome_Tipo_Anuncio) VALUES 
('Permuta'),
('Leilão'),
('Venda Direta'),
('Aluguel Temporário'),
('Aluguel Fixo');

-- Inserções adicionais para a tabela TipoImovel
INSERT INTO TipoImovel (NomeTipoImovel) VALUES 
('Cobertura'),
('Fazenda'),
('Apartamento Studio'),
('Sala Comercial'),
('Terreno Urbano');

-- Inserções adicionais para a tabela Imovel
INSERT INTO Imovel (Qtd_vaga, Qtd_quarto, Qtd_suite, Qtd_banheiro, Area_util, Valor_imovel, Observacoes, fk_TipoImovel_ID, fk_Endereco_ID, fk_TipoAnuncio_ID) VALUES 
(1, 2, 1, 1, 80, 300000.00, 'Excelente localização, vista panorâmica', 6, 16, 3),
(2, 5, 3, 4, 300, 1200000.00, 'Área para plantação e criação de gado', 7, 17, 4),
(0, 1, 0, 1, 30, 150000.00, 'Compacto e moderno, ideal para solteiros', 8, 18, 5),
(0, 0, 0, 1, 50, 200000.00, 'Escritório pronto para uso', 9, 19, 2),
(0, 0, 0, 0, 500, 5000000.00, 'Grande área verde e lago artificial', 10, 20, 1);

-- Inserções adicionais para a tabela Imagem
INSERT INTO Imagem (Nome_Imagem, url, fk_Imovel_ID) VALUES 
('Imagem6.jpg', '/images/imovel5', 5),
('Imagem7.jpg', '/images/imovel6', 6),
('Imagem8.jpg', '/images/imovel7', 7),
('Imagem9.jpg', '/images/imovel8', 8),
('Imagem10.jpg', '/images/imovel9', 9);

-- Inserções adicionais para a tabela Usuario
INSERT INTO Usuario ( Nome, Senha, DataHoraCrianao, DataHoraUltimoAcesso, email, fk_TipoUsuario_ID) VALUES 
( 'Corretor1', 'corretorpass', GETDATE(), GETDATE(), 'corretor1@example.com', 1),
( 'Proprietario1', 'proprietariopass', GETDATE(), GETDATE(), 'proprietario1@example.com', 2),
( 'Visitante1', 'visitantepass', GETDATE(), GETDATE(), 'visitante1@example.com', 3),
( 'EditorChefe1', 'editorchefepass', GETDATE(), GETDATE(), 'editor1@example.com', 4),
( 'ModeradorSenior1', 'modseniorpass', GETDATE(), GETDATE(), 'modsenior1@example.com', 5);

-- Inserções adicionais para a tabela Login
INSERT INTO Login ( Email, Senha, ID_Usuario) VALUES 
( 'corretor1@example.com', 'corretorpass', 6),
( 'proprietario1@example.com', 'proprietariopass', 7),
( 'visitante1@example.com', 'visitantepass', 8),
( 'editor1@example.com', 'editorchefepass', 9),
( 'modsenior1@example.com', 'modseniorpass', 10);

/*----------------------------FIM DA ESTRUTURA DO BANCO DE DADOS-----------------------------------------------------*/
select * from Bairro;