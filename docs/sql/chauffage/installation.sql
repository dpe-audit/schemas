DROP TABLE IF EXISTS chauffage.installation;

CREATE TYPE usage_solaire as ENUM (
    'chauffage',
    'chauffage_ecs',
);

CREATE TABLE chauffage.installation (
    id UUID PRIMARY KEY,
    chauffage_id UUID NOT NULL,
    description TEXT NOT NULL,
    surface FLOAT NOT NULL,
    comptage_individuel BOOLEAN NOT NULL,
    -- Solaire thermique
    solaire_thermique_usage usage_solaire,
    solaire_thermique_annee_installation INT,
    solaire_thermique_fch FLOAT,
    -- Régulation centrale
    regulation_centrale_presence BOOLEAN NOT NULL,
    regulation_centrale_minimum_temperature BOOLEAN NOT NULL,
    regulation_centrale_detection_presence BOOLEAN NOT NULL,
    -- Régulation terminale
    regulation_terminale_presence BOOLEAN NOT NULL,
    regulation_terminale_minimum_temperature BOOLEAN NOT NULL,
    regulation_terminale_detection_presence BOOLEAN NOT NULL,
    -- References
    --FOREIGN KEY (chauffage_id) REFERENCES ressource.chauffage(id)
);