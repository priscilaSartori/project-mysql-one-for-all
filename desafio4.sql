SELECT
    usuario.usuario_nome AS "usuario",
    IF(MAX(YEAR(historico.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuario usuario
INNER JOIN SpotifyClone.historico_de_reproducoes historico ON usuario.usuario_id = historico.usuario_id
GROUP BY usuario.usuario_nome
ORDER BY usuario_nome;