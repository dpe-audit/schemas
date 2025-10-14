DROP TABLE IF EXISTS chauffage.systeme_emetteur;

CREATE TABLE chauffage.systeme_emetteur (
    id INTEGER PRIMARY KEY,
    systeme_id UUID NOT NULL,
    emetteur_id UUID NOT NULL,
    -- References
    --FOREIGN KEY (systeme_id) REFERENCES chauffage.systeme(id)
    --FOREIGN KEY (emetteur_id) REFERENCES chauffage.emetteur(id)
);