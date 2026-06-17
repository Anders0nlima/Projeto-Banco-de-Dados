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

---

## 🚀 Histórico de Migrações (Updates)

Aqui está o histórico de alterações realizadas no esquema do banco de dados:

### 📁 [001_schema_migration.sql]
#### (Parte Inicial)
*   **Descrição**: Definição da estrutura e do esquema inicial do clone do Reddit.
*   **O que foi feito**: Criação das tabelas base do sistema (`usuarios`, `comunidades`, `inscricoes`, `postagens` com coluna `url` integrada, `comentarios` e `votos`).

### 📁 [002_schema_migration.sql]
#### (Correção de Erro e Suporte a Múltiplos Links)
*   **Problema resolvido**: A coluna `url` na tabela principal de `postagens` limitava as publicações a conterem no máximo um único link (ou forçava valores nulos em posts puramente de texto).
*   **O que foi feito**:
    1. Removeu a coluna `url` da tabela `postagens`.
    2. Criou a tabela `links_postagem` referenciando `postagens(id)` com chave estrangeira (`ON DELETE CASCADE`), permitindo associar múltiplos links a uma única postagem.