-- novos usuarios
INSERT INTO usuarios (nome_usuario, email, senha, biografia) VALUES
('Mariana_Dev', 'mari@gmail.com', 'senha123', 'Engenheira de Software e viciada em café.'), -- ID 4
('Carlos_DBA', 'carlos@gmail.com', 'senha123', 'Amo otimizar consultas SQL.'), -- ID 5
('Julia_Tech', 'julia@gmail.com', 'senha123', 'Explorando o mundo do Front-end.'), -- ID 6
('Larissa_QA', 'lari@gmail.com', 'senha123', 'Encontrar bugs é a minha terapia.'), -- ID 7
('Carla_Agile', 'carla@gmail.com', 'senha123', 'Scrum Master. Cadê a daily?'); -- ID 8

-- novas inscrições
INSERT INTO inscricoes (usuario_id, comunidade_id) VALUES
(4, 2), (5, 1), (6, 3), (7, 1), (4, 1), (4, 3);

-- novos posts
INSERT INTO postagens (comunidade_id, autor_id, titulo, conteudo) VALUES 
(3, 4, 'Como começar a aprender ingles em 2026?', 'Estou em dúvida se uso IA ou compro um curso. O que acham?'), -- ID 2
(3, 7, 'Quais as melhores opções de moradia de paises de lingua inglesa?', 'pretendo me mudar, qual escolher?'), -- ID 3
(1, 8, 'Argentina passou no sufoco', 'Estava torcendo para cabo verde, vovozinha vai ser bisavó na proxima copa'), -- ID 4
(1, 6, 'Brasil passa da noruega, quais as chances de perde?', 'haaland vai carregar esse time com a vitoria?'); -- ID 5

-- links nos posts (apenas post 4)
INSERT INTO links_postagem (postagem_id, url) VALUES 
(4, 'https://ge.globo.com/futebol/copa-do-mundo/'),
(4, 'https://www.espn.com.br/futebol/');

-- comentarios
INSERT INTO comentarios (postagem_id, autor_id, conteudo) VALUES
(3, 2, 'inglaterra, USA ou canada'), -- ID 3
(4, 2, 'confesso que tambem estava torcendo para cabo verde'); -- ID 4

-- comentario filho (ID 5)
INSERT INTO comentarios (postagem_id, autor_id, conteudo, comentario_pai_id) VALUES
(3, 1, 'acho que USA nao entra, dificil pelo sistema de imigração', 3);

-- votos nos posts
INSERT INTO votos (usuario_id, postagem_id, valor_voto) VALUES
(4, 4, 1), (5, 4, 1), (6, 4, 1), -- Post 4 recebe 3 upvotes
(7, 5, 1), (8, 5, -1);           -- Post 5 recebe 1 upvote e 1 downvote (empate)

-- votos nos comentatios
INSERT INTO votos_comentario (usuario_id, comentario_id, valor_voto) VALUES
(1, 3, -1), (2, 3, -1), (3, 3, -1); -- Comentário 3 recebe 3 downvotes

-- post salvos
INSERT INTO postagens_salvas (usuario_id, postagem_id) VALUES
(3, 2), (3, 3);

-- karma (com base nos votos de cima)

-- "Larissa_QA" fez o post 4 e ganhou +3
UPDATE usuarios SET karma_postagens = karma_postagens + 3 WHERE id = 8;

-- "Alessandro" fez o comentário 3 e tomou -3 na treta
UPDATE usuarios SET karma_comentarios = karma_comentarios - 3 WHERE id = 2;