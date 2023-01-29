SELECT
    cancoes.cancoes_nome AS "cancao",
    COUNT(historico.cancoes_id) AS "reproducoes"
FROM SpotifyClone.cancoes cancoes
INNER JOIN SpotifyClone.historico_de_reproducoes historico ON cancoes.cancoes_id = historico.cancoes_id
GROUP BY cancoes.cancoes_nome
ORDER BY reproducoes DESC, cancao
LIMIT 2;