ALTER TABLE postagens 
ADD COLUMN ativo BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE comentarios 
ADD COLUMN ativo BOOLEAN NOT NULL DEFAULT TRUE;

-- foram add na tabela postagens e comentarios a coluna ativo, se o tiver TRUE e visivel e for FALSE foi apagado