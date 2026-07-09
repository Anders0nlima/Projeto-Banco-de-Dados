# Reddit Database

Este repositório contém o modelo relacional e os scripts de banco de dados para Reddit. O sistema permite a criação de comunidades, postagens, threads de comentários complexas (pai e filho), e um sistema de reputação (Karma) baseado em upvotes e downvotes.

---

## 👥 Integrantes da Equipe
* **ANDERSON DA CONCEICAO LIMA** - 202511140003
* **ALESSANDRO ANDEL SILVA PEREIRA** - 202511140012
* **PAULO HENRIQUE DOS SANTOS BRITO** -  202511140005
  
---

## Sobre

O sistema foi modelado para suportar as principais funcionalidades do Reddit. As principais regras de negócio implementadas no banco de dados incluem:

* **Gestão de Usuários:** Autenticação básica e cálculo de reputação (Karma de Postagens e Comentários) via desnormalização para otimização de performance.
* **Comunidades (Subreddits):** Grupos criados por usuários onde as postagens são centralizadas.
* **Postagens e Comentários:** Suporte a textos e links, com estrutura recursiva para comentários (respostas a outros comentários).
* **Sistema de Votação:** Votos positivos e negativos em postagens e comentários, garantindo unicidade (um voto por usuário por entidade).
* **Soft Delete:** Implementação da coluna `ativo (BOOLEAN)` nas entidades principais para preservar a integridade referencial das discussões caso um usuário ou postagem seja "apagado".
* **Timezones:** Uso global de `TIMESTAMPTZ` para garantir a precisão cronológica e o suporte a múltiplos fusos horários.

---

## Diagrama Entidade-Relacionamento (ER)

<img width="749" height="477" alt="Image" src="https://github.com/user-attachments/assets/82fc653f-1bf5-4f67-b71c-8e6293f05f01" />

---

## Como Rodar as Migrações (Scripts SQL)
O banco de dados foi construído utilizando **PostgreSQL**. Para replicar a estrutura e popular o banco com os dados iniciais, siga os passos abaixo:

### Pré-requisitos
* Ter o **PostgreSQL** instalado localmente ou acesso a um banco em nuvem (ex: **Supabase**, Render, Heroku).
* Um cliente de banco de dados como **DBeaver**, **pgAdmin**, ou a própria interface web do Supabase (SQL Editor).

### Passo a Passo

1. Clone o repositório
2. Copie o conteúdo do arquivo onde estão as criações de tabelas e execute no seu cliente SQL. Isso criará toda a estrutura (Usuários, Comunidades, Postagens, Comentários, Votos, etc.)
3. Para inserir os dados de teste (usuários, posts, comentários e votos de exemplo), abra o arquivo de inserções ( seeds.sql) e execute o script.


## Detalhes das Tabelas (Schema)

Abaixo estão explicadas detalhadamente todas as tabelas criadas no banco de dados:
### 1. `usuarios`
Armazena todos os usuários cadastrados na plataforma.

### 2. `comunidades`
Armazena as comunidades criadas dentro da rede.

### 3. `inscricoes`
Tabela associativa que gerencia os membros de cada comunidade.

### 4. `postagens`
Registra as publicações feitas por usuários dentro das comunidades (o campo `url` foi removido nesta tabela e migrado para uma relação própria).

### 5. `comentarios`
Armazena as respostas feitas nas postagens. Suporta estrutura de comentários aninhados (em árvore).

### 6. `votos`
Controla o sistema de pontuação (Upvotes e Downvotes) das publicações, assegurando que um usuário só vote uma vez por postagem.

### 7. `links_postagem`
Armazena múltiplos links associados a uma postagem específica (relacionamento 1:N).

### 8. `votos_comentario`
permitir upvotes e downvotes nas respostas (comentarios)

### 9. `postagens_salvas`
permitir que o usuario salve postagens

---

## Histórico de Migrações

### 001_schema_migration.sql
*   **Descrição**: Definição da estrutura e do esquema inicial do Reddit.
*   **O que foi feito**: Criação das tabelas base do sistema (`usuarios`, `comunidades`, `inscricoes`, `postagens`, `comentarios` e `votos`).

### 002_schema_migration.sql
*   **Problema resolvido**: A coluna `url` na tabela principal de `postagens` limitava as publicações a conterem no máximo um único link.
*   **O que foi feito**: tiramos a coluna `url` da tabela `postagens` e criamos uma tabela `links_postagem` que referencia `postagens(id)` assim permitindo ter varios links em uma unica postagem.

### 003_schema_migration.sql
* **Problema resolvido**: Os comentarios feitos nos posts agora podem ser votados tambem
* **O que foi feito**: criamos a tabela `votos_comentario` do tipo associativa, ou seja, liga duas tabelas que existem (N:N)

### 004_schema_migration.sql
* **Problema resolvido**: Os posts agora podem ser salvos pelo usuario
* **O que foi feito**: criamos a tabela `postagens_salvas` do tipo associativa (N:N)

### 005_schema_migration.sql
* **Problema resolvido**: os post é os comentarios podem ser apagados, alterando para false ou true
* **O que foi feito**: incrementamos a coluna ativo em comentarios e postagens

### 006_schema_migration.sql
* **Problema resolvido**: tenho o horario da criação das entidades, facilitando sua ordenação
* **O que foi feito**: trocado o DATE por TIMESTAMPTZ

### 007_schema_migration.sql
* **Problema resolvido**: ainda nao tinha "ativo" em usuario e comunidade, alem disso foi add avatar e banner neles
* **O que foi feito**:

### 008_schema_migration.sql
* **Problema resolvido**: add a função de repostar postagens
* **O que foi feito**: 


### 009_schema_migration.sql
* **Problema resolvido**: karma
* **O que foi feito**: 
