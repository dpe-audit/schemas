DROP TABLE IF EXISTS refroidissement.installation;

CREATE TABLE refroidissement.installation (
    id UUID PRIMARY KEY,
    refroidissement_id UUID NOT NULL,
    description TEXT NOT NULL,
    surface FLOAT NOT NULL,
    -- Données calculées
    data_rdim FLOAT,
    -- References
    --FOREIGN KEY (refroidissement_id) REFERENCES ressource.refroidissement(id)
);