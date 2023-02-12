-- --------  << TF >>  ----------
--
--                     SCRIPT DE EXCLUSAO
--
-- Data Criacao ...........: 28/01/2023
-- Autor(es) ..............: Lucas Ursulino Boaventura, Victor Buendia Cruz De Alvim, Yudi Yamane de Azevedo
-- Banco de Dados .........: Postgres 13
-- Base de Dados (nome) ...: tf_etl_sbd2
--
-- Ultimas Alteracoes
--   28/01/2023 => Criaçao do script APAGA
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 01 Função
--
-- ---------------------------------------------------------

DROP TABLE IF EXISTS movies;

DROP TABLE IF EXISTS ratings;

DROP TABLE IF EXISTS tags;

DROP TABLE IF EXISTS genres;

DROP FUNCTION insert_tag;
