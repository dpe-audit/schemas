DROP TABLE IF EXISTS enveloppe.niveau;

CREATE TYPE inertie_paroi as ENUM('lourde', 'légère');

CREATE TYPE inertie as ENUM('tres_lourde', 'lourde', 'moyenne', 'légère');

CREATE TABLE enveloppe.niveau (
    id UUID PRIMARY KEY NOT NULL,
    enveloppe_id UUID NOT NULL,
    description VARCHAR(255) NOT NULL,
    surface FLOAT NOT NULL,
    inertie_paroi_verticale inertie_paroi NOT NULL,
    inertie_plancher_bas inertie_paroi NOT NULL,
    inertie_plancher_haut inertie_paroi NOT NULL,
    -- Données calculées
    data_inertie inertie NOT NULL,
    -- Références
    --FOREIGN KEY (enveloppe_id) REFERENCES ressource.enveloppe(id)
);