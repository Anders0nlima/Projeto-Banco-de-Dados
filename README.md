# Reddit Database Schema - Supabase Pattern

Este projeto consiste em um banco de dados relacional usando o
**Supabase**, modelando uma estrutura similar à do **Reddit**. A estrutura está organizada para facilitar a execução de migrations

---

## 🗄️ Detalhes das Tabelas (Schema)

Abaixo estão explicadas detalhadamente todas as tabelas criadas na migração inicial:

### 1. `usuarios`
Armazena todos os usuários cadastrados na plataforma.

### 2. `comunidades`
Armazena as comunidades criadas dentro da rede.

### 3. `inscricoes`
Tabela associativa que gerencia os membros de cada comunidade.

### 4. `postagens`
Registra as publicações feitas por usuários dentro das comunidades.

### 5. `comentarios`
Armazena as respostas feitas nas postagens. Suporta estrutura de comentários aninhados (em árvore).

### 6. `votos`
Controla o sistema de pontuação (Upvotes e Downvotes) das publicações, assegurando que um usuário só vote uma vez por postagem.

---