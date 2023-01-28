SELECT artista.artista_nome AS "artista",
       album.album_nome AS "album"
FROM SpotifyClone.artista artista
INNER JOIN SpotifyClone.album album ON album.artista_id = artista.artista_id
WHERE artista.artista_nome LIKE '%Elis Regina%'
ORDER BY album;