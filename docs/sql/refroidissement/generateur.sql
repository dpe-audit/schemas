DROP TABLE IF EXISTS refroidissement.generateur;

CREATE TYPE type_generateur as ENUM(
    'pac_air_air',
    'pac_air_eau',
    'pac_eau_eau',
    'pac_eau_glycolee_eau',
    'pac_geothermique',
    'autre_systeme_thermodynamique',
    'autre',
    'reseau_froid',
);

CREATE TYPE energie_generateur as ENUM('electricite', 'gaz_naturel', 'gpl', 'reseau_froid');

CREATE TABLE refroidissement.generateur (
    id UUID PRIMARY KEY,
    refroidissement_id UUID NOT NULL,
    reseau_froid_id UUID,
    description TEXT NOT NULL,
    type type_generateur NOT NULL,
    energie energie_generateur NOT NULL,
    seer FLOAT,
    -- Données calculées
    data_eer FLOAT,
    data_rdim FLOAT,
    data_cef_fr FLOAT,
    data_cep_fr FLOAT,
    data_eges_fr FLOAT,
    -- References
    --FOREIGN KEY (refroidissement_id) REFERENCES ressource.refroidissement(id)
);