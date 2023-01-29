SELECT artista.artista_nome AS "artista",
       album.album_nome AS "album",
	     COUNT(seguindo.usuario_id) AS "seguidores"
FROM SpotifyClone.artista artista
INNER JOIN SpotifyClone.album album ON album.artista_id = artista.artista_id
INNER JOIN SpotifyClone.seguindo_artistas seguindo ON seguindo.artista_id = artista.artista_id
GROUP BY artista.artista_nome, album.album_nome
ORDER BY seguidores DESC, artista, album;