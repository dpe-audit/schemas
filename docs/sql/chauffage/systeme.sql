DROP TABLE IF EXISTS chauffage.systeme;

CREATE TYPE type_systeme as ENUM(
    'chauffage_central',
    'chauffage_divise',
);

CREATE TYPE type_distribution as ENUM(
    'hydraulique',
    'aeraulique',
    'fluide_frigorigene'
);

CREATE TYPE isolation as ENUM(
    'non_isole',
    'isole',
);

CREATE TABLE chauffage.systeme (
    id UUID PRIMARY KEY,
    chauffage_id UUID NOT NULL,
    installation_id UUID NOT NULL,
    generateur_id UUID NOT NULL,
    type type_systeme NOT NULL,
    -- Réseau
    reseau_type_distribution type_distribution,
    reseau_presence_circulateur_externe BOOLEAN,
    reseau_niveaux_desservis INTEGER,
    reseau_isolation isolation,
    -- References
    --FOREIGN KEY (chauffage_id) REFERENCES ressource.chauffage(id)
    --FOREIGN KEY (installation_id) REFERENCES chauffage.installation(id)
    --FOREIGN KEY (generateur_id) REFERENCES chauffage.generateur(id)
);