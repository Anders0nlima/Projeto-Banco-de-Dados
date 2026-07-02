CREATE VIEW vw_karma_usuarios AS
SELECT 
    u.id AS usuario_id,
    u.nome_usuario,
    
    GREATEST(0, COALESCE((
        SELECT SUM(v.valor_voto) 
        FROM postagens p 
        JOIN votos v ON v.postagem_id = p.id 
        WHERE p.autor_id = u.id
    ), 0)) AS karma_postagens,
    
    GREATEST(0, COALESCE((
        SELECT SUM(vc.valor_voto) 
        FROM comentarios c 
        JOIN votos_comentario vc ON vc.comentario_id = c.id 
        WHERE c.autor_id = u.id
    ), 0)) AS karma_comentarios
FROM usuarios u;