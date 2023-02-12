-- --------  << TF - ETL >>  ----------
--
--                     SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 28/01/2023
-- Autor(es) ..............: Lucas Ursulino Boaventura, Victor Buendia Cruz De Alvim, Yudi Yamane de Azevedo
-- Banco de Dados .........: Postgres 13
-- Base de Dados (nome) ...: tf_etl_sbd2
--
-- Ultimas Alteracoes
--   28/01/2023 => Criaçao do script fisico
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 01 Função
--
-- ---------------------------------------------------------

CREATE DATABASE tf_etl_sbd2;

USE tf_etl_sbd2;

CREATE TABLE IF NOT EXISTS movies
(
    movieId            INTEGER,
    imdbId             INTEGER,
    tmdbId             INTEGER,
    title              VARCHAR(200),
    genres             VARCHAR(500)[],
    publish_year       INTEGER,
    user_tag_amount    INTEGER,
    tag_amount         INTEGER,
    tags               VARCHAR(500)[],
    average_rating     DECIMAL(15, 2),
    user_review_amount INTEGER,
    review_amount      INTEGER,

    CONSTRAINT MOVIES_PK PRIMARY KEY (movieId),
    CONSTRAINT MOVIES_UK UNIQUE (title)
);

CREATE TABLE ratings
(
    userId    INTEGER        NOT NULL,
    movieId   INTEGER        NOT NULL,
    rating    DECIMAL(15, 2) NOT NULL,
    timestamp TIMESTAMP      NOT NULL,
    dt        DATE           NOT NULL,

    CONSTRAINT RATINGS_UK UNIQUE (userId, movieId)
);

CREATE TABLE tags
(
    userId    INTEGER      NOT NULL,
    movieId   INTEGER      NOT NULL,
    tag       VARCHAR(500) NOT NULL,
    timestamp TIMESTAMP,
    dt        DATE

--     CONSTRAINT TAGS_UK UNIQUE (userId, movieId, tag)
);

CREATE TABLE genres
(
    genre        VARCHAR(100) NOT NULL,
    publish_year INTEGER,
    movies       INTEGER      NOT NULL,

    CONSTRAINT GENRES_UK UNIQUE (genre, publish_year)
);

CREATE FUNCTION insert_tag(v_userId numeric, v_movieId numeric, v_tag character varying, v_timestamp character varying, v_dt character varying) RETURNS VOID
    LANGUAGE PLPGSQL AS
$$
DECLARE
    FORMAT_DATE DATE:= v_dt::date;
    FORMAT_TS TIMESTAMP:= v_timestamp::timestamp;
BEGIN
    INSERT INTO tags (userId, movieId, tag, timestamp, dt)
    VALUES (v_userId, v_movieId, v_tag, v_timestamp::timestamp, v_dt::date);
END;
$$;
