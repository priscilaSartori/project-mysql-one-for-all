SELECT cancoes.cancoes_nome AS "nome_musica",
CASE
	WHEN cancoes.cancoes_nome LIKE '%Bard%' THEN REPLACE (cancoes.cancoes_nome, 'Bard', 'QA')
  WHEN cancoes.cancoes_nome LIKE '%Amar%' THEN REPLACE (cancoes.cancoes_nome, 'Amar', 'Code Review')
  WHEN cancoes.cancoes_nome LIKE '%Pais%' THEN REPLACE (cancoes.cancoes_nome, 'Pais', 'Pull Requests')
  WHEN cancoes.cancoes_nome LIKE '%SOUL%' THEN REPLACE (cancoes.cancoes_nome, 'SOUL', 'CODE')
  WHEN cancoes.cancoes_nome LIKE '%SUPERSTAR%' THEN REPLACE (cancoes.cancoes_nome, 'SUPERSTAR', 'SUPERDEV')
	ELSE 'Sem_alteracao'
END AS novo_nome
FROM SpotifyClone.cancoes AS cancoes
GROUP BY nome_musica
HAVING novo_nome <> 'Sem_alteracao'
ORDER BY novo_nome DESC;