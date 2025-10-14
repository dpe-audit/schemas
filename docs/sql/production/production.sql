DROP TABLE IF EXISTS ressource.production;

CREATE TABLE ressource.production (
    id UUID PRIMARY KEY,
    -- Données calculées
    data_ppv FLOAT NOT NULL,
);