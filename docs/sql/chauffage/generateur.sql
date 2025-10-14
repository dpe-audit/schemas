DROP TABLE IF EXISTS chauffage.generateur;

CREATE TYPE type_generateur as ENUM(
    'chaudiere',
    'convecteur_bi_jonction',
    'convecteur_electrique',
    'panneau_rayonnant_electrique',
    'plafond_rayonnant_electrique',
    'plancher_rayonnant_electrique',
    'radiateur_electrique',
    'radiateur_electrique_accumulation',
    'generateur_air_chaud',
    'pac_air_air',
    'pac_air_eau',
    'pac_eau_eau',
    'pac_eau_glycolee_eau',
    'pac_geothermique',
    'cuisiniere',
    'foyer_ferme',
    'insert',
    'poele',
    'poele_bouilleur',
    'radiateur_gaz',
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

CREATE TYPE position_chaudiere as ENUM(
    'chaudiere_murale',
    'chaudiere_sol',
);

CREATE TYPE label as ENUM(
    'flamme_verte',
    'nf_performance',
);

CREATE TYPE mode_combustion as ENUM(
    'standard',
    'basse_temperature',
    'condensation',
);

CREATE TABLE chauffage.generateur (
    id UUID PRIMARY KEY,
    chauffage_id UUID NOT NULL,
    description TEXT NOT NULL,
    type type_generateur NOT NULL,
    energie energie_generateur NOT NULL,
    bienergie energie_generateur,
    annee_installation INTEGER,
    -- Position
    position_chaudiere position_chaudiere,
    position_reseau_chaleur_id TEXT,
    position_generateur_mixte_id UUID,
    position_generateur_collectif BOOLEAN NOT NULL,
    position_generateur_multi_batiment BOOLEAN NOT NULL,
    position_volume_chauffe BOOLEAN NOT NULL,
    position_cascade INTEGER,
    position_priorite_cascade INTEGER,
    -- Signalétique
    signaletique_pn FLOAT,
    signaletique_scop FLOAT,
    signaletique_rpn FLOAT,
    signaletique_rpint FLOAT,
    signaletique_qp0 FLOAT,
    signaletique_pveilleuse FLOAT,
    signaletique_tfonc30 FLOAT,
    signaletique_tfonc100 FLOAT,
    signaletique_presence_ventouse BOOLEAN,
    signaletique_presence_regulation_combustion BOOLEAN,
    signaletique_label label,
    signaletique_mode_combustion mode_combustion,
    -- References
    --FOREIGN KEY (chauffage_id) REFERENCES ressource.chauffage(id)
);