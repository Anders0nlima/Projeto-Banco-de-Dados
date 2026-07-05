-- povoamento do banco de dados
-- usar como DML - povoamento

INSERT INTO usuarios (nome_usuario, email, senha) VALUES
('Anderson_Lima', 'ander@gmail.com', '12345'),
('Alessadro Frontend', 'ale@gmail.com', '56781'),
('PauloBritoSuporte', 'paulo@gmail.com', '23456');


UPDATE usuarios
SET biografia = 'Sou estudante'
WHERE nome_usuario = 'Anderson_Lima';

UPDATE usuarios
SET biografia = 'oi galera'
WHERE id = 2;

UPDATE usuarios
SET biografia = 'trabalhando...'
WHERE id = 3;


INSERT INTO comunidades (nome, descricao, criador_id) VALUES
('copa do mundo', 'tudo sobre a copa de 2026', 1),
('redes', 'sobre infraestrutura', 2),
('lingua inglesa', 'feito para estudos de ingles', 3);


INSERT INTO inscricoes (usuario_id, comunidade_id) VALUES
(1, 3);

INSERT INTO postagens (comunidade_id, autor_id, titulo, conteudo) VALUES 
(1, 1, 'Brasil na copa', 'brasil contra japão, quem ganha?');

INSERT INTO links_postagem (postagem_id, url) VALUES 
(1, 'https://ge.globo.com/futebol/copa-do-mundo/'),
(1, 'https://www.espn.com.br/futebol/');


INSERT INTO comentarios (postagem_id, autor_id, conteudo) VALUES
(1, 1, 'brasil vai ganhar esse jogo');

INSERT INTO comentarios (postagem_id, autor_id, conteudo, comentario_pai_id) VALUES
(1, 2, 'acho que nao, na ultima vez que jogaram juntos, perderam. vou de 2 a 1 pro japao', 1);

INSERT INTO votos (usuario_id, postagem_id, valor_voto) VALUES
(1, 1, 1);

INSERT INTO votos (usuario_id, postagem_id, valor_voto) VALUES 
(2, 1, 1);

UPDATE usuarios 
SET karma_postagens = karma_postagens + 1 
WHERE id = 1;

INSERT INTO votos_comentario (usuario_id, comentario_id, valor_voto) VALUES
(1, 1, -1);


INSERT INTO votos_comentario (usuario_id, comentario_id, valor_voto) VALUES
(1, 2, 1); -- para vota no comentario filho, nao e diferente, so basta colocar o id

INSERT INTO postagens_salvas (usuario_id, postagem_id) VALUES
(3, 1);

INSERT INTO repostagens (usuario_id, postagem_id) VALUES
(3, 1);