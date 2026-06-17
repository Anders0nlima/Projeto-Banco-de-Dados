ALTER TABLE postagens DROP COLUMN IF EXISTS url;

CREATE TABLE links_postagem ( 
    id           SERIAL PRIMARY KEY, 
    postagem_id  INTEGER NOT NULL REFERENCES postagens(id) ON DELETE CASCADE, 
    url          VARCHAR(2000) NOT NULL,
    data_criacao TIMESTAMPTZ NOT NULL DEFAULT now()
);

--problema resolvido: a url nao fez sentido na postagem, entao foi removido. foi criado uma nova table para suportar varios links, pois em um post podem ter varios links