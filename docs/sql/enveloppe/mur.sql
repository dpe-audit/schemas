DROP TABLE IF EXISTS enveloppe.mur;

CREATE TYPE type_structure as ENUM(
    'pierre_moellons',
    'pierre_moellons_avec_remplissage',
    'pise_ou_beton_terre',
    'pan_bois_sans_remplissage',
    'pan_bois_avec_remplissage',
    'bois_rondin',
    'brique_pleine_simple',
    'brique_pleine_double_avec_lame_air',
    'brique_creuse',
    'bloc_beton_plein',
    'bloc_beton_creux',
    'beton_banche',
    'beton_machefer',
    'brique_terre_cuite_alveolaire',
    'sandwich_beton_isolant_beton_sans_isolation_rapportee',
    'cloison_platre',
    'ossature_bois_sans_remplissage',
    'ossature_bois_avec_remplissage_tout_venant',
    'ossature_bois_avec_remplissage_isolant'
);

CREATE TYPE type_doublage as ENUM(
    'sans_doublage',
    'indetermine',
    'lame_air_inferieur_15mm',
    'lame_air_superieur_15mm',
    'materiaux_connu'
);

CREATE TYPE inertie as ENUM('lourde', 'legere');

CREATE TYPE mitoyennete as ENUM(
    'exterieur',
    'enterre',
    'vide_sanitaire',
    'terre_plein',
    'sous_sol_non_chauffe',
    'local_non_chauffe',
    'local_non_residentiel',
    'local_residentiel',
    'local_non_accessible'
);

CREATE TYPE etat_isolation as ENUM('isole', 'non_isole');

CREATE TYPE type_isolation as ENUM('iti', 'ite', 'itr', 'iti_ite', 'itr_iti', 'itr_ite', 'itr_iti_ite');

CREATE TYPE performance as ENUM(
    'tres_bonne',
    'bonne',
    'moyenne',
    'insuffisante',
);

CREATE TABLE enveloppe.mur (
    id UUID PRIMARY KEY NOT NULL,
    enveloppe_id UUID NOT NULL,
    description TEXT NOT NULL,
    type_structure type_structure,
    epaisseur_structure FLOAT,
    type_doublage type_doublage,
    presence_enduit_isolant BOOLEAN,
    paroi_ancienne BOOLEAN,
    inertie inertie,
    annee_construction INTEGER,
    annee_renovation INTEGER,
    u0 FLOAT,
    u FLOAT,
    -- Position
    position_surface FLOAT NOT NULL,
    position_mitoyennete mitoyennete NOT NULL,
    position_orientation FLOAT,
    position_local_non_chauffe_id UUID,
    -- Isolation
    isolation_etat etat_isolation NOT NULL,
    isolation_type type_isolation,
    isolation_annee_installation INTEGER,
    isolation_epaisseur FLOAT,
    isolation_resistance_thermique FLOAT,
    -- Donénes calculées
    data_u0 FLOAT NOT NULL,
    data_u FLOAT NOT NULL,
    data_b FLOAT NOT NULL,
    data_sdep FLOAT NOT NULL,
    data_dp FLOAT NOT NULL,
    data_performance performance NOT NULL,
    -- References
    --FOREIGN KEY (enveloppe_id) REFERENCES ressource.enveloppe(id)
    --FOREIGN KEY (position_local_non_chauffe_id) REFERENCES enveloppe.local_non_chauffe(id)
);