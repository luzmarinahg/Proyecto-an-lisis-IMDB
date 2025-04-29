USE proyecto2_equipo1_v2

-- ¿Qué géneros han recibido más premios Óscar?
-- No se puede hacer porque no tnemos 

-- ¿Qué género es el mejor valorado en IMDB?
SELECT genre, AVG(imdb_rating) AS MediaRating
FROM film as f
INNER JOIN film_details as fd
ON f.film_id = fd.idOwner
GROUP BY genre;

-- ¿En que año se estrenaron más películas?
SELECT year, COUNT(film_id) AS TotalFilms
FROM film
WHERE type = "Movie"
GROUP BY film_id DESC;

-- ¿En que año se estrenaron mas cortos?
SELECT year, COUNT(film_id) AS TotalShorts
FROM film
WHERE type = "Short"
GROUP BY film_id DESC;

-- ¿Cuál es la mejor serie valorada en IMDB?


-- ¿Cuál es la película mejor valorada en IMDB?
SELECT id_details, MAX(imdb_rating) AS Rates, name AS Title
FROM film_details
GROUP BY id_details
ORDER BY Rates DESC;

-- ¿Qué actor/actriz ha recibido más premios?
SELECT * FROM actor;

SELECT id_actor, name , MAX(awards) AS Awards
FROM actor
GROUP BY id_actor, name
ORDER BY Awards DESC;

-- ¿Hay algun actor/actriz que haya recibido más de un premio Óscar?
SELECT COUNT(oscar_id) AS Oscars, best_actor, best_actress
FROM oscars
WHERE Oscars > 1;

-- PREGUNTAS AÑADIDAS POR NOSOTRAS


-- ¿Qué directores han hecho más de una película?
SELECT COUNT(idOwner) AS Films, direction
FROM film_details
GROUP BY direction
HAVING Films > 1
ORDER BY Films DESC;

-- ¿Qué guionistas han escrito más de una película?
SELECT COUNT(idOwner) AS Films, writers
FROM film_details
GROUP BY writers
HAVING Films > 1
ORDER BY Films DESC;

-- ¿Cual es la pelicula más larga?
SELECT name AS Title, MAX(length) AS Lenght
FROM film_details;

-- ¿Cual es el género con las peliculas más largas?
SELECT genre, AVG(length) AS Length
FROM film_details AS fd
INNER JOIN film AS f
ON fd.idOwner = f.film_id
ORDER BY Length DESC;

-- ¿Cuantas peliculas por género se hicieron cada año?
SELECT genre, COUNT(film_id) AS Films
FROM film
ORDER BY Films DESC;
