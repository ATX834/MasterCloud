/*Suppression de la data base si elle existe */
DROP DATABASE IF EXISTS mastercloud;

/*Création de la base de donnée*/
CREATE DATABASE mastercloud;

/*Utilisation de la base de donnée*/
USE mastercloud;

/*Création des tables*/
CREATE TABLE `utilisateur`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`email` VARCHAR(255) NOT NULL,
	`nom` VARCHAR(80) NOT NULL,
	`mot_de_passe` VARCHAR(255) NOT NULL,
	`image` VARCHAR(255),
	`est_connecte` BOOLEAN,
	PRIMARY KEY(`id`)
	);

CREATE TABLE `playlist`(
	`id`INT NOT NULL AUTO_INCREMENT,
	`nom` VARCHAR(255) NOT NULL,
	`image` VARCHAR(255) NOT NULL,
	`est_privee` BOOLEAN,
	`nombre_likes` INT NOT NULL DEFAULT 0,
	`nombre_dislikes` INT NOT NULL DEFAULT 0,
	`utilisateur_id` INT NOT NULL,	
	PRIMARY KEY(`id`),
	FOREIGN KEY(`utilisateur_id`) REFERENCES `utilisateur`(`id`)
	);

CREATE TABLE `musique`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`nom` VARCHAR(255) NOT NULL,
	`artiste` VARCHAR(255) NOT NULL,
	`album` VARCHAR(255) NOT NULL,
	`genre` VARCHAR(255) NOT NULL,
	`image` VARCHAR(255) NOT NULL,	
	`source` VARCHAR(255) NOT NULL,
	`playlist_id` INT NOT NULL,	
	PRIMARY KEY(`id`),
	FOREIGN KEY(`playlist_id`) REFERENCES `playlist`(`id`) ON DELETE CASCADE
	);

CREATE TABLE `votes`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`like` BOOLEAN NOT NULL,
	`utilisateur_id` INT NOT NULL,
	`playlist_id` INT NOT NULL,
	PRIMARY KEY(`id`),
	FOREIGN KEY(`utilisateur_id`) REFERENCES `utilisateur`(`id`),
	FOREIGN KEY(`playlist_id`) REFERENCES `playlist`(`id`)
);
