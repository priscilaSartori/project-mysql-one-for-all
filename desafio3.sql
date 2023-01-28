SELECT usuario.usuario_nome AS "usuario",
	     COUNT(historico.cancoes_id) AS "qt_de_musicas_ouvidas",
       ROUND(SUM(cancoes.duracao_segundos)/60, 2) AS "total_minutos"
FROM SpotifyClone.usuario usuario
INNER JOIN SpotifyClone.historico_de_reproducoes historico ON usuario.usuario_id = historico.usuario_id 
INNER JOIN SpotifyClone.cancoes cancoes ON cancoes.cancoes_id = historico.cancoes_id 
GROUP BY usuario_nome
ORDER BY usuario_nome;