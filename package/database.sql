


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+01:00";



--
-- Table Directeur (Super-Administrateur)
--

CREATE TABLE Directeur(
	Id VARCHAR(15) NOT NULL,
	Nom VARCHAR(50) DEFAULT NULL,
	Prenom VARCHAR(50) DEFAULT NULL,
	Password VARCHAR(255) NOT NULL UNIQUE,
	Email VARCHAR(100) NOT NULL UNIQUE,
	CONSTRAINT PK_DR PRIMARY KEY(Id)
);



--
-- Table Administrateurs
--

-- CONSTRAINT FK_EMPS_SERVICES FOREIGN KEY (SERVICE_NO) REFERENCES SERVICES(NO);



CREATE TABLE Administrateurs(
	Id VARCHAR(15) NOT NULL,
	Id_Directeur VARCHAR(15) NOT NULL,
	Nom VARCHAR(50) DEFAULT NULL,
	Prenom VARCHAR(50) DEFAULT NULL,
	Password VARCHAR(255) NOT NULL UNIQUE,
	Email VARCHAR(100) NOT NULL UNIQUE,
	Role ENUM('SupEns','SupEtd') NOT NULL DEFAULT 'SupEns', 
	CONSTRAINT PK_AD PRIMARY KEY(Id),
	CONSTRAINT FK_AD_DR FOREIGN KEY(Id_Directeur) REFERENCES Directeur(Id)
);





-- Table Enseignants


CREATE TABLE Enseignants(
	Id VARCHAR(15) NOT NULL,
	Id_Administrateur VARCHAR(15) NOT NULL,
	Nom VARCHAR(50) DEFAULT NULL,
	Prenom VARCHAR(50) DEFAULT NULL,
	Password VARCHAR(255) NOT NULL UNIQUE,
	Email VARCHAR(100) NOT NULL UNIQUE,
	Specialite VARCHAR(100) NOT NULL,
	CONSTRAINT PK_EN PRIMARY KEY(Id),
	CONSTRAINT FK_EN_AD FOREIGN KEY(Id_Administrateur) REFERENCES Administrateurs(Id)
	
);




-- Table Etudiants


CREATE TABLE Etudiants (
	Id VARCHAR(15) NOT NULL,	
	Id_Administrateur VARCHAR(15) NOT NULL,
	Id_Enseignants VARCHAR(15) NOT NULL,
	Nom VARCHAR(50) DEFAULT NULL,
	Prenom VARCHAR(50) DEFAULT NULL,
	Password VARCHAR(50) NOT NULL UNIQUE,
	Email VARCHAR(100) NOT NULL,
	Annee_Academique VARCHAR(20) NOT NULL,
	Sex ENUM('HOMME','FEMME') NOT NULL,
	Status ENUM('Actif', 'Suspendu', 'Diplômé', 'Exclu') NOT NULL DEFAULT 'Actif',
	CONSTRAINT PK_ET PRIMARY KEY(Id),
	CONSTRAINT FK_ET_AD FOREIGN KEY(Id_Administrateur) REFERENCES Administrateurs(Id),
	CONSTRAINT FK_ET_EN FOREIGN KEY(Id_Enseignants) REFERENCES Enseignants(Id)
);



-- Table Notes

CREATE TABLE Notes(
  Id_Etudiant VARCHAR(15) NOT NULL,
  Id_Matiere VARCHAR(15) NOT NULL,
  Mentions ENUM('NON VALIDE','VALIDE','PASSABLE','BIEN','TRES BIEN') NOT NULL,
  Note DECIMAL(4, 2) NOT NULL,
  CONSTRAINT PK_NT PRIMARY KEY(Id_Etudiant,Id_Matiere)
);




--Table Matières



CREATE TABLE Matieres(
	Id VARCHAR(15) NOT NULL,
  Id_Enseignants VARCHAR(15) NOT NULL,
  Description VARCHAR(100) DEFAULT NULL,
  CONSTRAINT PK_MA PRIMARY KEY(Id),
  CONSTRAINT FK_MT_EN FOREIGN KEY(Id_Enseignants) REFERENCES Enseignants(Id)
);



-- Insertion Pour Le Test : 


-- Id : Prefix - Year(2024) - Unique Number

-- Prefix : 
  -- DR : Directeur
  -- AD : Administrateur
  -- ST : Etudiant
  -- ES : Enseignant
  -- MT : Matiere

-- Unique Number : x est variable (Tout en verifient l'unicite apres chaque ajouts) 
 -- Directeur : 0xx1
 -- Administrateur : x11x
 -- Enseignant : 0x12
 -- Etudiant : 09xx
 -- Matiere : 70xx



-- Insert data into Directeur table

INSERT INTO Directeur (Id, Nom, Prenom, Password, Email) VALUES
('DR-2024-0001','Dupont', 'Jean', 'mdp12345', 'jean.dupont@ecole.com'),
('DR-2024-0011','Martin', 'Claire', 'password123', 'claire.martin@ecole.com'),
('DR-2024-0121','Durand', 'Pierre', 'passe123', 'pierre.durand@ecole.com'),
('DR-2024-0031','Lemoine', 'Sophie', 'admin2024', 'sophie.lemoine@ecole.com');




-- Insert data into Administrateurs table

INSERT INTO Administrateurs (Id, Id_Directeur, Nom, Prenom, Password, Email, Role) VALUES
('AD-2024-9110', 'DR-2024-0001', 'Garnier', 'Julie', 'adminPass1', 'julie.garnier@ecole.com', 'SupEns'),
('AD-2024-8111', 'DR-2024-0011', 'Pires', 'Yann', 'adminPass2', 'yann.pires@ecole.com', 'SupEtd'),
('AD-2024-7112', 'DR-2024-0001', 'Cohen', 'Amandine', 'adminPass3', 'amandine.cohen@ecole.com', 'SupEns'),
('AD-2024-6113', 'DR-2024-0121', 'Durand', 'Luc', 'adminPass4', 'luc.durand@ecole.com', 'SupEns'),
('AD-2024-5114', 'DR-2024-0011', 'Germain', 'Carla', 'adminPass5', 'carla.germain@ecole.com', 'SupEtd'),
('AD-2024-4115', 'DR-2024-0001', 'Marchand', 'Pierre', 'adminPass6', 'pierre.marchand@ecole.com', 'SupEns'),
('AD-2024-3116', 'DR-2024-0031', 'Lemoine', 'Sarah', 'adminPass7', 'sarah.lemoine@ecole.com', 'SupEns'),
('AD-2024-2117', 'DR-2024-0011', 'Blanc', 'Michel', 'adminPass8', 'michel.blanc@ecole.com', 'SupEtd'),
('AD-2024-1118', 'DR-2024-0031', 'Benoit', 'Julien', 'adminPass9', 'julien.benoit@ecole.com', 'SupEns'),
('AD-2024-0119', 'DR-2024-0001', 'Dufresne', 'Elise', 'adminPass10', 'elise.dufresne@ecole.com', 'SupEtd');



-- Insert data into Enseignants table

-- 

INSERT INTO Enseignants (Id, Id_Administrateur, Nom, Prenom, Password, Email, Specialite) VALUES
('ES-2024-0112', 'AD-2024-9110', 'Lafarge', 'Victor', 'enseignant123', 'victor.lafarge@ecole.com', 'Mathematiques'),
('ES-2024-0212', 'AD-2024-4115', 'Ribeiro', 'Ana', 'enseignant234', 'ana.ribeiro@ecole.com', 'Informatique'),
('ES-2024-0312', 'AD-2024-4115', 'Martin', 'Thomas', 'enseignant345', 'thomas.martin@ecole.com', 'Physique'),
('ES-2024-0412', 'AD-2024-9110', 'Pires', 'Lucie', 'enseignant456', 'lucie.pires@ecole.com', 'Chimie'),
('ES-2024-0512', 'AD-2024-4115', 'Durand', 'Claire', 'enseignant567', 'claire.durand@ecole.com', 'Biologie'),
('ES-2024-0612', 'AD-2024-4115', 'Blanchard', 'Michel', 'enseignant678', 'michel.blanchard@ecole.com', 'Mathematiques'),
('ES-2024-0712', 'AD-2024-9110', 'Garnier', 'Sophie', 'enseignant789', 'sophie.garnier@ecole.com', 'Informatique'),
('ES-2024-0812', 'AD-2024-4115', 'Lemoine', 'Claire', 'enseignant890', 'claire.lemoine@ecole.com', 'Informatique'),
('ES-2024-0912', 'AD-2024-9110', 'Lemoine', 'Eric', 'enseignant901', 'eric.lemoine@ecole.com', 'Mathématiques'),
('ES-2024-0012', 'AD-2024-9110', 'Tremblay', 'Sylvie', 'enseignant012', 'sylvie.tremblay@ecole.com', 'Chimie');



-- Insert data into Etudiants table

INSERT INTO Etudiants (Id, Id_Administrateur, Id_Enseignants, Nom, Prenom, Password, Email, Annee_Academique, Sex, Status) VALUES

-- Chaque Enseignant ayant 10 Etudiant : 

('ST-2024-0910', 'AD-2024-8111', 'ES-2024-0112', 'Dupont', 'Marie', 'etudiant123', 'marie.dupont@ecole.com', '2023-2024', 'FEMME', 'Actif'),
('ST-2024-0911', 'AD-2024-8111', 'ES-2024-0112', 'Dufresne', 'Paul', 'etudiant234', 'paul.dufresne@ecole.com', '2023-2024', 'HOMME', 'Suspendu'),
('ST-2024-0912', 'AD-2024-8111', 'ES-2024-0112', 'Durand', 'Léo', 'etudiant345', 'leo.durand@ecole.com', '2023-2024', 'HOMME', 'Actif'),
('ST-2024-0921', 'AD-2024-8111', 'ES-2024-0112', 'Pires', 'Sophie', 'etudiant456', 'sophie.pires@ecole.com', '2023-2024', 'FEMME', 'Diplômé'),
('ST-2024-0913', 'AD-2024-8111', 'ES-2024-0112', 'Blanc', 'Julien', 'etudiant567', 'julien.blanc@ecole.com', '2023-2024', 'HOMME', 'Exclu'),
('ST-2024-0931', 'AD-2024-8111', 'ES-2024-0112', 'Garnier', 'Clara', 'etudiant678', 'clara.garnier@ecole.com', '2023-2024', 'FEMME', 'Actif'),
('ST-2024-0914', 'AD-2024-8111', 'ES-2024-0112', 'Lemoine', 'Benoit', 'etudiant789', 'benoit.lemoine@ecole.com', '2023-2024', 'HOMME', 'Diplômé'),
('ST-2024-0941', 'AD-2024-8111', 'ES-2024-0112', 'Ribeiro', 'Isabelle', 'etudiant890', 'isabelle.ribeiro@ecole.com', '2023-2024', 'FEMME', 'Suspendu'),
('ST-2024-0915', 'AD-2024-8111', 'ES-2024-0112', 'Tremblay', 'Lucie', 'etudiant901', 'lucie.tremblay@ecole.com', '2023-2024', 'FEMME', 'Exclu'),
('ST-2024-0951', 'AD-2024-8111', 'ES-2024-0112', 'Fournier', 'Marc', 'etudiant012', 'marc.fournier@ecole.com', '2023-2024', 'HOMME', 'Actif');

-- Add 9 Etudiant ...






-- Insert data into Matieres table

INSERT INTO Matieres (Id, Id_Enseignants, Description) VALUES
('MT-2024-7010', 'ES-2024-0112', 'Mathématiques avancées'),
('MT-2024-7011', 'ES-2024-0212', 'Informatique pour tous'),
('MT-2024-7012', 'ES-2024-0312', 'Physique expérimentale'),
('MT-2024-7020', 'ES-2024-0412', 'Chimie organique'),
('MT-2024-7021', 'ES-2024-0512', 'Biologie cellulaire'),
('MT-2024-7022', 'ES-2024-0612', 'Mathématiques appliquées'),
('MT-2024-7030', 'ES-2024-0712', 'Informatique et algorithmes'),
('MT-2024-7031', 'ES-2024-0812', 'Algorithmique avancée'),
('MT-2024-7033', 'ES-2024-0912', 'Mathématiques pures'),
('MT-2024-7040', 'ES-2024-0012', 'Chimie analytique');



-- Insert data into Notes table

INSERT INTO Notes (Id_Etudiant, Id_Matiere, Mentions, Note) VALUES
-- Etudiant 1 : 
('ST-2024-0910', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0910', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0910', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0910', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0910', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0910', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0910', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0910', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0910', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0910', 'MT-2024-7040', 'NON VALIDE', 8.50),
('ST-2024-0911', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0911', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0911', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0911', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0911', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0911', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0911', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0911', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0911', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0911', 'MT-2024-7040', 'NON VALIDE', 8.50),
('ST-2024-0912', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0912', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0912', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0912', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0912', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0912', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0912', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0912', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0912', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0912', 'MT-2024-7040', 'NON VALIDE', 8.50),
('ST-2024-0921', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0921', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0921', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0921', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0921', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0921', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0921', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0921', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0921', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0921', 'MT-2024-7040', 'NON VALIDE', 8.50),
('ST-2024-0913', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0913', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0913', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0913', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0913', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0913', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0913', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0913', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0913', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0913', 'MT-2024-7040', 'NON VALIDE', 8.50),
('ST-2024-0931', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0931', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0931', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0931', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0931', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0931', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0931', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0931', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0931', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0931', 'MT-2024-7040', 'NON VALIDE', 8.50),
('ST-2024-0914', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0914', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0914', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0914', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0914', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0914', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0914', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0914', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0914', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0914', 'MT-2024-7040', 'NON VALIDE', 8.50),
('ST-2024-0941', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0941', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0941', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0941', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0941', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0941', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0941', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0941', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0941', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0941', 'MT-2024-7040', 'NON VALIDE', 8.50), 
('ST-2024-0915', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0915', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0915', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0915', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0915', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0915', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0915', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0915', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0915', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0915', 'MT-2024-7040', 'NON VALIDE', 8.50),
('ST-2024-0951', 'MT-2024-7010', 'BIEN', 16.50),
('ST-2024-0951', 'MT-2024-7011', 'PASSABLE', 10.00),
('ST-2024-0951', 'MT-2024-7012', 'TRES BIEN', 18.75),
('ST-2024-0951', 'MT-2024-7020', 'NON VALIDE', 7.00),
('ST-2024-0951', 'MT-2024-7021', 'VALIDE', 14.00),
('ST-2024-0951', 'MT-2024-7022', 'BIEN', 15.00),
('ST-2024-0951', 'MT-2024-7030', 'TRES BIEN', 19.00),
('ST-2024-0951', 'MT-2024-7031', 'VALIDE', 12.50),
('ST-2024-0951', 'MT-2024-7033', 'PASSABLE', 11.25),
('ST-2024-0951', 'MT-2024-7040', 'NON VALIDE', 8.50);


COMMIT;



