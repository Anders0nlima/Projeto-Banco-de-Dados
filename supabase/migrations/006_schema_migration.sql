ALTER TABLE usuarios
ALTER COLUMN data_criacao TYPE TIMESTAMPTZ;

ALTER TABLE usuarios 
ALTER COLUMN data_criacao SET DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE comunidades
ALTER COLUMN data_criacao TYPE TIMESTAMPTZ;

ALTER TABLE comunidades 
ALTER COLUMN data_criacao SET DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE inscricoes
ALTER COLUMN data_criacao TYPE TIMESTAMPTZ;

ALTER TABLE inscricoes 
ALTER COLUMN data_criacao SET DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE postagens
ALTER COLUMN data_criacao TYPE TIMESTAMPTZ;

ALTER TABLE postagens 
ALTER COLUMN data_criacao SET DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE comentarios
ALTER COLUMN data_criacao TYPE TIMESTAMPTZ;

ALTER TABLE comentarios 
ALTER COLUMN data_criacao SET DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE votos
ALTER COLUMN data_criacao TYPE TIMESTAMPTZ;

ALTER TABLE votos 
ALTER COLUMN data_criacao SET DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE votos_comentario
ALTER COLUMN data_criacao TYPE TIMESTAMPTZ;

ALTER TABLE votos_comentario 
ALTER COLUMN data_criacao SET DEFAULT CURRENT_TIMESTAMP;


ALTER TABLE postagens_salvas
ALTER COLUMN data_salvo TYPE TIMESTAMPTZ;

ALTER TABLE postagens_salvas 
ALTER COLUMN data_salvo SET DEFAULT CURRENT_TIMESTAMP;

-- o TIMESTAMPTZ é mais completo, entao troquei em todos, os mais importantes eram em comentarios para saber qual foi criado primeiro se dois usuario ao mesmo tempo