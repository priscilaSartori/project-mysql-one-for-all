SELECT COUNT(historico.usuario_id) AS "quantidade_musicas_no_historico"
FROM SpotifyClone.historico_de_reproducoes historico
INNER JOIN SpotifyClone.usuario usuario ON usuario.usuario_id = historico.usuario_id
WHERE usuario.usuario_nome LIKE '%Barbara Liskov%';