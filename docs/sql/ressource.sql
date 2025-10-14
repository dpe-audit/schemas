DROP TABLE IF EXISTS ressource;

CREATE TYPE type_batiment as ENUM(
    'maison',
    'immeuble',
);

CREATE TYPE exposition_enveloppe as ENUM(
    'exposition_simple',
    'exposition_multiple',
);

CREATE TABLE ressource (
    id UUID PRIMARY KEY,
    enveloppe_id INTEGER NOT NULL,
    chauffage_id INTEGER NOT NULL,
    ecs_id INTEGER NOT NULL,
    ventilation_id INTEGER NOT NULL,
    refroidissement_id INTEGER NOT NULL,
    eclairage_id INTEGER NOT NULL,
    production_id INTEGER NOT NULL,
    date_creation DATE NOT NULL,
    date_visite DATE NOT NULL,
    date_etablissement DATE NOT NULL,
    -- Adresse
    adresse_nom TEXT,
    adresse_code_postal TEXT NOT NULL,
    adresse_code_insee TEXT NOT NULL,
    adresse_commune TEXT NOT NULL,
    adresse_ban_id TEXT,
    -- Bâtiment
    batiment_type type_batiment NOT NULL,
    batiment_annee_construction INTEGER NOT NULL,
    batiment_altitude FLOAT NOT NULL,
    batiment_logements INTEGER NOT NULL,
    batiment_surface_habitable FLOAT NOT NULL,
    batiment_hauteur_sous_plafond FLOAT NOT NULL,
    batiment_materiaux_anciens BOOLEAN NOT NULL,
    batiment_rnb_id UUID,
    -- Enveloppe
    enveloppe_exposition enveloppe_exposition NOT NULL,
    enveloppe_q4pa_conv FLOAT,
    presence_brasseurs_air BOOLEAN NOT NULL,
    -- Références
    --FOREIGN KEY (enveloppe_id) REFERENCES ressource.enveloppe(id)
    --FOREIGN KEY (chauffage_id) REFERENCES ressource.chauffage(id)
    --FOREIGN KEY (ecs_id) REFERENCES ressource.ecs(id)
    --FOREIGN KEY (ventilation_id) REFERENCES ressource.ventilation(id)
    --FOREIGN KEY (refroidissement_id) REFERENCES ressource.refroidissement(id)
    --FOREIGN KEY (eclairage_id) REFERENCES ressource.eclairage(id)
    --FOREIGN KEY (production_id) REFERENCES ressource.production(id)
);