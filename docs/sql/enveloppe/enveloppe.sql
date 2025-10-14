DROP TABLE IF EXISTS ressource.enveloppe;

CREATE TYPE exposition as ENUM(
    'exposition_simple',
    'exposition_multiple',
);

CREATE TABLE ressource.enveloppe (
    id UUID PRIMARY KEY,
    exposition exposition NOT NULL,
    q4pa_conv FLOAT,
    presence_brasseurs_air BOOLEAN NOT NULL,
    -- Données calculées
);