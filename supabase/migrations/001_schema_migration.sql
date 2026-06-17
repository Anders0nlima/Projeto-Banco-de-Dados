CREATE TABLE usuarios (
    id            SERIAL PRIMARY KEY,
    nome_usuario  VARCHAR(50) UNIQUE NOT NULL,
    email         VARCHAR(200) UNIQUE NOT NULL,
    senha         VARCHAR(200) NOT NULL,
    biografia     TEXT,
    data_criacao  DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE comunidades (
    id            SERIAL PRIMARY KEY,
    nome          VARCHAR(50) UNIQUE NOT NULL,
    descricao     TEXT,
    criador_id    INTEGER REFERENCES usuarios(id) ON DELETE SET NULL,
    data_criacao  DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE inscricoes (
    usuario_id    INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    comunidade_id INTEGER NOT NULL REFERENCES comunidades(id) ON DELETE CASCADE,
    funcao        VARCHAR(20) NOT NULL DEFAULT 'membro',
    data_criacao  DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (usuario_id, comunidade_id)
);

CREATE TABLE postagens (
    id            SERIAL PRIMARY KEY,
    comunidade_id INTEGER NOT NULL REFERENCES comunidades(id) ON DELETE CASCADE,
    autor_id      INTEGER REFERENCES usuarios(id) ON DELETE SET NULL,
    titulo        VARCHAR(300) NOT NULL,
    conteudo      TEXT,
    url           VARCHAR(2000),
    data_criacao  DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE comentarios (
    id                SERIAL PRIMARY KEY,
    postagem_id       INTEGER NOT NULL REFERENCES postagens(id) ON DELETE CASCADE,
    autor_id          INTEGER REFERENCES usuarios(id) ON DELETE SET NULL,
    comentario_pai_id INTEGER REFERENCES comentarios(id) ON DELETE CASCADE,
    conteudo          TEXT NOT NULL,
    data_criacao      DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE votos (
    usuario_id    INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    postagem_id   INTEGER NOT NULL REFERENCES postagens(id) ON DELETE CASCADE,
    valor_voto    SMALLINT NOT NULL CHECK (valor_voto IN (1, -1)),
    data_criacao  DATE NOT NULL DEFAULT CURRENT_DATE,
    PRIMARY KEY (usuario_id, postagem_id)
);
