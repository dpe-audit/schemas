DROP TABLE IF EXISTS ecs.installation;

CREATE TYPE usage as ENUM (
    'ecs',
    'chauffage_ecs',
);

CREATE TABLE ecs.installation (
    id UUID PRIMARY KEY,
    ecs_id UUID NOT NULL,
    description TEXT NOT NULL,
    surface FLOAT NOT NULL,
    -- Solaire thermique
    solaire_thermique_usage usage,
    solaire_thermique_annee_installation INT,
    solaire_thermique_fecs FLOAT,
    -- References
    --FOREIGN KEY (ecs_id) REFERENCES ressource.ecs(id)
);