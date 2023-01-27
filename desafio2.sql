SELECT COUNT(DISTINCT cancoes.cancoes_id) AS "cancoes",
	     COUNT(DISTINCT artistas.artista_id) AS "artistas",
       COUNT(DISTINCT albuns.album_id) AS "albuns"
FROM SpotifyClone.cancoes cancoes
INNER JOIN SpotifyClone.artista artistas
INNER JOIN SpotifyClone.album albuns;