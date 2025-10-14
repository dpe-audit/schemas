DROP TABLE IF EXISTS enveloppe.pont_thermique;

CREATE TYPE type_liaison as ENUM(
    'plancher_bas_mur',
    'plancher_haut_mur',
    'refend_mur',
    'plancher_intermediaire_mur',
    'menuiserie_mur'
);

CREATE TABLE enveloppe.pont_thermique (
    id UUID PRIMARY KEY NOT NULL,
    enveloppe_id UUID NOT NULL,
    description TEXT NOT NULL,
    longueur FLOAT NOT NULL,
    kpt FLOAT,
    -- Liaison
    liaison_type type_liaison NOT NULL,
    liaison_pont_thermique_partiel BOOLEAN NOT NULL,
    liaison_mur_id UUID NOT NULL,
    liaison_plancher_id UUID,
    liaison_ouverture_id UUID,
    -- Données calculées
    data_k FLOAT NOT NULL,
    data_pt FLOAT NOT NULL,
    -- References
    --FOREIGN KEY (enveloppe_id) REFERENCES ressource.enveloppe(id)
);