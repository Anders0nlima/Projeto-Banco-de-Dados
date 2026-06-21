CREATE TABLE postagens_salvas (
    usuario_id   INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    postagem_id  INTEGER NOT NULL REFERENCES postagens(id) ON DELETE CASCADE,
    data_salvo   DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (usuario_id, postagem_id) --faz o usuario salvar so uma vez
);

-- problema resolvido: o usuario agora pode salvar a postagem
-- tabela associativa: está conectando a tabela usuarios com a postagem comentarios.