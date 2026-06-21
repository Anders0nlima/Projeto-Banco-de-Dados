CREATE TABLE votos_comentario (
    usuario_id    INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    comentario_id INTEGER NOT NULL REFERENCES comentarios(id) ON DELETE CASCADE,
    valor_voto    SMALLINT NOT NULL CHECK (valor_voto IN (1, -1)),
    data_criacao  DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (usuario_id, comentario_id) -- pra votar so uma vez
);

-- problema resolvido: os comentarios dos posts tbm podem ser votados ("curtidos")
-- tabela associativa: está conectando a tabela usuarios com a tabela comentarios.