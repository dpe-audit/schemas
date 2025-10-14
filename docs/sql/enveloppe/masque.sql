DROP TABLE IF EXISTS enveloppe.masque;

CREATE TYPE type_masque as ENUM(
    'proche',
    'lointain',
);

CREATE TYPE configuration_masque as ENUM(
    'homogene',
    'non_homogene',
    'fond_balcon',
    'fond_et_flanc_loggias',
    'balcon_ou_auvent',
    'paroi_laterale_sans_obstacle_au_sud',
    'paroi_laterale_avec_obstacle_au_sud'
);

CREATE TYPE secteur as ENUM(
    'lateral',
    'lateral_sud',
    'central',
    'central_sud',
);

CREATE TABLE enveloppe.masque (
    id UUID PRIMARY KEY NOT NULL,
    enveloppe_id UUID NOT NULL,
    description TEXT NOT NULL,
    type type_masque NOT NULL,
    configuration configuration_masque NOT NULL,
    hauteur FLOAT,
    orientation FLOAT,
    profondeur FLOAT,
    secteur secteur,
    -- Données calculées
    data_fe1 FLOAT,
    data_fe2 FLOAT,
    data_omb FLOAT,
    -- References
    --FOREIGN KEY (enveloppe_id) REFERENCES ressource.enveloppe(id)
);