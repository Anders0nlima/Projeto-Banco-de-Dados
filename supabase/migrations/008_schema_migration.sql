CREATE TABLE repostagens (
    usuario_id INT REFERENCES usuarios(id),
    postagem_id INT REFERENCES postagens(id),
    data_repost TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, postagem_id)
);


-- funçao de repostar postagens