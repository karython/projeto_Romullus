# Projeto Romullus - Sistema de Gerenciamento de Imóveis

Bem-vindo ao Projeto Romullus, um sistema de gerenciamento de imóveis desenvolvido para facilitar o controle e organização de informações relacionadas a propriedades e usuários.

## Estrutura do Banco de Dados

O banco de dados do projeto Romullus é composto por diversas tabelas inter-relacionadas para armazenar informações sobre usuários, imóveis, endereços, tipos de anúncios, entre outros. A seguir está a estrutura do banco de dados:

1. **Usuario:** Armazena informações sobre os usuários do sistema.
2. **TipoUsuario:** Define os tipos de usuários (Administrador, Usuário Padrão, etc.).
3. **Cidade:** Contém informações sobre cidades, associadas a estados.
4. **Bairro:** Armazena informações sobre bairros, associados a cidades.
5. **UF:** Representa os estados brasileiros.
6. **Endereco:** Contém informações sobre endereços, associados a bairros.
7. **TipoAnuncio:** Define os tipos de anúncios (Venda, Aluguel, etc.).
8. **Imovel:** Armazena detalhes sobre os imóveis, incluindo suas características.
9. **TipoImovel:** Define os tipos de imóveis (Apartamento, Casa, etc.).
10. **Imagem:** Contém informações sobre imagens associadas a imóveis.
11. **Login:** Gerencia informações de login e associa usuários aos seus logins.

## Relacionamentos

- A tabela **Usuario** possui uma chave estrangeira que faz referência à tabela **TipoUsuario**.
- As tabelas **Cidade**, **Bairro**, e **Endereco** têm chaves estrangeiras para representar relacionamentos geográficos.
- A tabela **Imovel** possui chaves estrangeiras que se referem às tabelas **TipoImovel**, **Endereco**, e **TipoAnuncio**.
- A tabela **Imagem** tem uma chave estrangeira que se refere à tabela **Imovel**.
- A tabela **Login** possui uma chave estrangeira que faz referência à tabela **Usuario**.

## Inserções de Exemplo

O arquivo SQL inclui inserções de exemplo para popular algumas das tabelas com dados fictícios.

## Como Contribuir

Se você deseja contribuir para o desenvolvimento deste projeto, siga as etapas abaixo:

1. Faça um fork do repositório.
2. Clone o repositório forkado para o seu ambiente local.
3. Faça as alterações desejadas.
4. Faça commit das suas alterações.
5. Envie as alterações para o seu fork.
6. Abra um pull request neste repositório.

Agradecemos por contribuir para o projeto Romullus!
