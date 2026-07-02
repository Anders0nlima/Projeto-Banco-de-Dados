-- povoamento do banco de dados


SELECT postagens.titulo, postagens.conteudo, usuarios.nome_usuario
FROM postagens
JOIN usuarios ON postagens.autor_id = usuarios.id
WHERE postagens.id = 1;



SELECT usuarios.nome_usuario, postagens.titulo
FROM repostagens
JOIN usuarios ON repostagens.usuario_id = usuarios.id
JOIN postagens ON repostagens.postagem_id = postagens.id
WHERE repostagens.usuario_id = 3;