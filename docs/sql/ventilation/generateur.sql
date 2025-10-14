DROP TABLE IF EXISTS ventilation.generateur;

CREATE TYPE type_generateur as ENUM(
    'vmc_simple_flux',
    'vmc_simple_flux_gaz',
    'vmc_basse_pression',
    'vmc_double_flux',
    'ventilation_hybride',
    'ventilation_mecanique',
    'puit_climatique',
    'vmi',
    'vmr',
);

CREATE TYPE type_vmc as ENUM(
    'autoreglable',
    'hygroreglable_type_a',
    'hygroreglable_type_b',
);

CREATE TABLE ventilation.generateur (
    id UUID PRIMARY KEY,
    ventilation_id UUID NOT NULL,
    description TEXT NOT NULL,
    type type_generateur NOT NULL,
    generateur_collectif BOOLEAN NOT NULL,
    presence_echangeur_thermique BOOLEAN,
    annee_installation INTEGER,
    type_vmc type_vmc,
    -- Données calculées
    rdim FLOAT,
    ratio_utilisation FLOAT,
    pvent_moy FLOAT,
    cef_aux FLOAT cep_aux FLOAT,
    eges_aux FLOAT,
    -- Reference
    --FOREIGN KEY (ventilation_id) REFERENCES ressource.ventilation(id)
);