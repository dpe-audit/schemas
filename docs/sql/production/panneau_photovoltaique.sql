DROP TABLE IF EXISTS production.panneau_photovoltaique;

CREATE TABLE production.panneau_photovoltaique (
    id UUID PRIMARY KEY,
    production_id UUID NOT NULL,
    description TEXT NOT NULL,
    orientation FLOAT NOT NULL,
    inclinaison FLOAT NOT NULL,
    modules INT NOT NULL,
    surface FLOAT,
    installation_collective BOOLEAN NOT NULL,
    -- Données calculées
    data_kpv FLOAT,
    data_ppv FLOAT,
    -- References
    --FOREIGN KEY (production_id) REFERENCES ressource.production(id)
);