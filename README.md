# Reddit Database Schema

Este projeto consiste em um banco de dados relacional usando o
**Supabase**, modelando uma estrutura similar à do **Reddit**. A estrutura está organizada para facilitar a execução de migrations.

---

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