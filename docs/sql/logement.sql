DROP TABLE IF EXISTS ressource.logement;

CREATE TYPE position as ENUM('rdc', 'etage_intermediaire', 'dernier_etage');

CREATE TYPE typologie as ENUM('T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7');

CREATE TABLE ressource.logement (
    id UUID PRIMARY KEY,
    ressource_id UUID NOT NULL,
    description TEXT NOT NULL,
    surface_habitable FLOAT NOT NULL,
    hauteur_sous_plafond FLOAT NOT NULL,
    position position NOT NULL,
    typologie typologie NOT NULL,
    -- Reference
    --FOREIGN KEY (ressource_id) REFERENCES ressource(id)
);