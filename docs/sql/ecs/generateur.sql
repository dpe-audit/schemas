DROP TABLE IF EXISTS ecs.generateur;

CREATE TYPE type_generateur as ENUM(
    'chauffe_eau',
    'chaudiere',
    'cet_air_ambiant',
    'cet_air_exterieur',
    'cet_air_extrait',
    'pac_double_service',
    'poele_bouilleur',
    'reseau_chaleur',
);

CREATE TYPE energie_generateur as ENUM(
    'electricite',
    'gaz_naturel',
    'gpl',
    'fioul',
    'charbon',
    'bois_buche',
    'bois_plaquette',
    'bois_granule',
    'reseau_chaleur',
);

CREATE TYPE position_chauffe_eau as ENUM(
    'chauffe_eau_vertical',
    'chauffe_eau_horizontal',
);

CREATE TYPE label as ENUM(
    'ne_performance_a',
    'ne_performance_b',
    'ne_performance_c',
);

CREATE TYPE mode_combustion as ENUM(
    'standard',
    'basse_temperature',
    'condensation',
);

CREATE TABLE ecs.generateur (
    id UUID PRIMARY KEY,
    ecs_id UUID NOT NULL,
    description TEXT NOT NULL,
    type type_generateur NOT NULL,
    energie energie_generateur NOT NULL,
    annee_installation INTEGER,
    -- Position
    position_chauffe_eau position_chauffe_eau,
    position_generateur_collectif BOOLEAN NOT NULL,
    position_generateur_multi_batiment BOOLEAN NOT NULL,
    position_volume_chauffe BOOLEAN NOT NULL,
    position_generateur_mixte_id UUID,
    position_reseau_chaleur_id TEXT,
    -- Signalétique
    signaletique_volume_stockage FLOAT NOT NULL,
    signaletique_presence_ventouse BOOLEAN,
    signaletique_pn FLOAT,
    signaletique_pn FLOAT,
    signaletique_cop FLOAT,
    signaletique_rpn FLOAT,
    signaletique_qp0 FLOAT,
    signaletique_pveilleuse FLOAT,
    signaletique_label label,
    -- Données calculées
    -- References
    --FOREIGN KEY (ecs_id) REFERENCES ressource.ecs(id)
);