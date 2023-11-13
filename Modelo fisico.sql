use Romullus;

CREATE TABLE Usuario (
    ID int PRIMARY KEY,
    Nome varchar(120),
    Senha varchar(32),
    DataHoraCrianao datetime,
    DataHoraUltimoAcesso datetime,
    email varchar(120),
    fk_TipoUsuario_ID int
);

CREATE TABLE TipoUsuario (
    ID int PRIMARY KEY,
    Tipo varchar(80)
);

CREATE TABLE Cidade (
    Nome_cidade varchar(60),
    ID int PRIMARY KEY,
    fk_UF_ID int
);

CREATE TABLE Bairro (
    ID int PRIMARY KEY,
    Nome_bairro varchar(60),
    fk_Cidade_ID int
);

CREATE TABLE UF (
    ID int PRIMARY KEY,
    Nome_UF varchar(120),
    Sigla_UF char(2)
);

CREATE TABLE Endereco (
    ID int PRIMARY KEY,
    Logradouro varchar(120),
    Numero int,
    Complemento varchar(120),
    fk_Bairro_ID int
);

CREATE TABLE TipoAnuncio (
    ID int PRIMARY KEY,
    Nome_Tipo_Anuncio varchar(30)
);

CREATE TABLE Imovel (
    Qtd_vaga int,
    Qtd_quarto int,
    Qtd_suite int,
    Qtd_banheiro int,
    Area_util int,
    Valor_imovel decimal,
    ID int PRIMARY KEY,
    Observacoes text,
    fk_TipoImovel_ID int,
    fk_Endereco_ID int,
    fk_TipoAnuncio_ID int
);

CREATE TABLE TipoImovel (
    ID int PRIMARY KEY,
    NomeTipoImovel varchar(80)
);

CREATE TABLE Imagem (
    ID int PRIMARY KEY,
    Nome_Imagem varchar(120),
    url varchar(80),
    fk_Imovel_ID int
);

CREATE TABLE Login (
    ID int PRIMARY KEY,
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