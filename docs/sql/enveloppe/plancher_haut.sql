DROP TABLE IF EXISTS enveloppe.plancher_haut;

CREATE TYPE configuration as ENUM('combles_perdus', 'rampants', 'terrasse');

CREATE TYPE type_structure as ENUM(
    'plafond_avec_ou_sans_remplissage',
    'plafond_entre_solives_metalliques',
    'plafond_entre_solives_bois',
    'plafond_bois_sur_solives_metalliques',
    'plafond_bois_sous_solives_metalliques',
    'bardeaux_et_remplissage',
    'plafond_bois_sur_solives_bois',
    'plafond_bois_sous_solives_bo',
    'dalle_beton',
    'plafond_lourd',
    'combles_amenages_sous_rampant',
    'toiture_chaume',
    'plafond_patre',
    'bac_acier'
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

CREATE TABLE enveloppe.plancher_haut (
    id UUID PRIMARY KEY NOT NULL,
    enveloppe_id UUID NOT NULL,
    description TEXT NOT NULL,
    configuration configuration,
    type_structure type_structure,
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