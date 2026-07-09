-- qual usuario que criou o maior numero de posts em junho de 2026?
SELECT u.nome_usuario, COUNT(p.id) AS total_de_postagens
FROM postagens p
JOIN usuarios u ON p.autor_id = u.id
WHERE p.data_criacao::text LIKE '2026-06-%'
GROUP BY u.nome_usuario
ORDER BY total_de_postagens DESC
LIMIT 1;


-- quais são os posts que tem os comentarios mais votados com alguma menção ao precidente Trump?
SELECT p.titulo, c.conteudo, sum(vc.valor_voto) AS total_votos
FROM postagens p
JOIN comentarios c ON p.id = c.postagem_id
JOIN votos_comentario vc ON c.id = vc.comentario_id
WHERE c.conteudo ILIKE '%trump%'
GROUP by p.id, p.titulo, c.id, c.conteudo
ORDER by total_votos DESC;