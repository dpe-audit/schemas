DROP TABLE IF EXISTS chauffage.emetteur;

CREATE TYPE type_emetteur as ENUM(
    'plancher_chauffant',
    'plafond_chauffant',
    'radiateur_monotube',
    'radiateur_bitube',
    'radiateur',
);

CREATE TYPE temperature_distribution as ENUM(
    'basse',
    'moyenne',
    'haute'
);

CREATE TABLE chauffage.emetteur (
    id UUID PRIMARY KEY,
    chauffage_id UUID NOT NULL,
    description TEXT NOT NULL,
    type type_emetteur NOT NULL,
    temperature_distribution temperature_distribution NOT NULL,
    presence_robinet_thermostatique BOOLEAN NOT NULL,
    annee_installation INTEGER,
    -- References
    --FOREIGN KEY (chauffage_id) REFERENCES ressource.chauffage(id)
);