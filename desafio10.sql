SELECT cancoes.cancoes_nome AS "nome",
       COUNT(historico.usuario_id) AS "reproducoes"
FROM SpotifyClone.cancoes cancoes
INNER JOIN SpotifyClone.historico_de_reproducoes historico ON historico.cancoes_id = cancoes.cancoes_id
INNER JOIN SpotifyClone.usuario usuario ON historico.usuario_id = usuario.usuario_id
WHERE plano_id IN (
    SELECT plano_id
    FROM SpotifyClone.plano
    WHERE plano_id IN (1, 4)
)
GROUP BY cancoes.cancoes_nome
ORDER BY nome;