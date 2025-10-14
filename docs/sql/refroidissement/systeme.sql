DROP TABLE IF EXISTS refroidissement.systeme;

CREATE TABLE refroidissement.systeme (
    id UUID PRIMARY KEY,
    refroidissement_id UUID NOT NULL,
    installation_id UUID NOT NULL,
    generateur_id UUID NOT NULL,
    description TEXT NOT NULL,
    -- Données calculées
    data_rdim FLOAT,
    data_cef_fr FLOAT,
    data_cep_fr FLOAT,
    data_eges_fr FLOAT,
    data_cef_aux FLOAT,
    data_cep_aux FLOAT,
    data_eges_aux FLOAT,
    -- References
    --FOREIGN KEY (refroidissement_id) REFERENCES ressource.refroidissement(id)
    --FOREIGN KEY (installation_id) REFERENCES refroidissement.installation(id)
    --FOREIGN KEY (generateur_id) REFERENCES refroidissement.generateur(id)
);