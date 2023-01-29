DROP DATABASE IF EXISTS SpotifyClone;

 CREATE DATABASE IF NOT EXISTS SpotifyClone;

 CREATE TABLE SpotifyClone.plano(
     plano_id INT PRIMARY KEY auto_increment,
     plano_nome VARCHAR(30) NOT NULL,
     valor_plano DECIMAL(3, 2) NOT NULL
 ) engine = InnoDB;

 CREATE TABLE SpotifyClone.usuario(
     usuario_id INT PRIMARY KEY auto_increment,
     usuario_nome VARCHAR(100) NOT NULL,
     idade VARCHAR(50) NOT NULL,
     data_assinatura DATE NOT NULL,
     plano_id INT NOT NULL, 
     FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
 ) engine = InnoDB;

 CREATE TABLE SpotifyClone.artista(
     artista_id INT PRIMARY KEY auto_increment,
     artista_nome VARCHAR(30) NOT NULL
 ) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
     album_id INT PRIMARY KEY auto_increment,
     album_nome VARCHAR(30) NOT NULL,
     artista_id INT NOT NULL,
     ano_lancamento YEAR NOT NULL,
     FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
 ) engine = InnoDB;

 CREATE TABLE SpotifyClone.cancoes(
     cancoes_id INT PRIMARY KEY auto_increment,
     cancoes_nome VARCHAR(100) NOT NULL,
     duracao_segundos INT NOT NULL,
     album_id INT NOT NULL,
     FOREIGN KEY (album_id) REFERENCES album (album_id)
 ) engine = InnoDB;

 CREATE TABLE SpotifyClone.historico_de_reproducoes( 
     usuario_id INT,
     cancoes_id INT,
     CONSTRAINT PRIMARY KEY(usuario_id, cancoes_id),
     data_reproducao DATETIME NOT NULL,
     FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
     FOREIGN KEY (cancoes_id) REFERENCES cancoes (cancoes_id)
 ) engine = InnoDB;

 CREATE TABLE SpotifyClone.seguindo_artistas(
     usuario_id INT,
     artista_id INT,
     CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
     FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
     FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
 ) engine = InnoDB;

 INSERT INTO SpotifyClone.plano (plano_id, plano_nome, valor_plano)
 VALUES
   (1, 'gratuito', 0.00),
   (2, 'familiar', 7.99),
   (3, 'universitário', 5.99),
   (4, 'pessoal', 6.99);

 INSERT INTO SpotifyClone.usuario (usuario_id, usuario_nome, idade, plano_id, data_assinatura)
 VALUES
   (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
   (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
   (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
   (4, 'Martin Fowler', 46, 2, '2017-01-17'),
   (5, 'Sandi Metz', 58, 2, '2018-04-29'),
   (6, 'Paulo Freire', 19, 3, '2018-02-14'),
   (7, 'Bell Hooks', 26, 3, '2018-01-05'),
   (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
   (9, 'Judith Butler', 45, 4, '2020-05-13'),
   (10, 'Jorge Amado', 58, 4, '2017-02-17');

 INSERT INTO SpotifyClone.artista (artista_id, artista_nome)
 VALUES
   (1, 'Beyoncé'),
   (2, 'Queen'),
   (3, 'Elis Regina'),
   (4, 'Baco Exu do Blues'),
   (5, 'Blind Guardian'),
   (6, 'Nina Simone');

 INSERT INTO SpotifyClone.album (album_id, album_nome, artista_id, ano_lancamento)
 VALUES
   (1, 'Renaissance', 1, 2022),
   (2, 'Jazz', 2, 1978),
   (3, 'Hot Space', 2, 1982),
   (4, 'Falso Brilhante', 3, 1998),
   (5, 'Vento de Maio', 3, 2001),
   (6, 'QVVJFA?', 4, 2003),
   (7, 'Somewhere Far Beyond', 5, 2007),
   (8, 'I Put A Spell On You', 6, 2012);

 INSERT INTO SpotifyClone.cancoes (cancoes_id, cancoes_nome, duracao_segundos, album_id)
 VALUES
   (1, 'BREAK MY SOUL', 279, 1),
   (2, 'VIRGO’S GROOVE', 369, 1),
   (3, 'ALIEN SUPERSTAR', 116, 1),
   (4, 'Don’t Stop Me Now', 203, 2),
   (5, 'Under Pressure', 152, 3),
   (6, 'Como Nossos Pais', 105, 4),
   (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
   (8, 'Samba em Paris', 267, 6),
   (9, 'The Bard’s Song', 244, 7),
   (10, 'Feeling Good', 100, 8);

 INSERT INTO SpotifyClone.historico_de_reproducoes (usuario_id, cancoes_id, data_reproducao)
 VALUES
   (1, 8, "2022-02-28 10:45:55"),
   (1, 2, '2020-05-02 05:30:35'),
   (1, 10, '2020-03-06 11:22:33'),
   (2, 10, '2022-08-05 08:05:17'),
   (2, 7, '2020-01-02 07:40:33'),
   (3, 10, '2020-11-13 16:55:13'),
   (3, 2, '2020-12-05 18:38:30'),
   (4, 8, '2021-08-15 17:10:10'),
   (5, 8, '2022-01-09 01:44:33'),
   (5, 5, '2020-08-06 15:23:43'),
   (6, 7, '2017-01-24 00:31:17'),
   (6, 1, '2017-10-12 12:35:20'),
   (7, 4, '2011-12-15 22:30:49'),
   (8, 4, '2012-03-17 14:56:41'),
   (9, 9, '2022-02-24 21:14:22'),
   (10, 3, '2015-12-13 08:30:22');

 INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
 VALUES
   (1, 1),
   (1, 2),
   (1, 3),
   (2, 1),
   (2, 3),
   (3, 2),
   (4, 4),
   (5, 5),
   (5, 6),
   (6, 6),
   (6, 1),
   (7, 6),
   (9, 3),
   (10, 2);