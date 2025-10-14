DROP TABLE IF EXISTS ecs.systeme;

CREATE TYPE isolation as ENUM(
    'non_isole',
    'isole',
);

CREATE TYPE bouclage as ENUM(
    'non_boucle',
    'boucle',
    'trage'
);

CREATE TABLE ecs.systeme (
    id UUID PRIMARY KEY,
    ecs_id UUID NOT NULL,
    installation_id UUID NOT NULL,
    generateur_id UUID NOT NULL,
    -- Réseau
    reseau_alimentation_contigue BOOLEAN NOT NULL,
    reseau_niveaux_desservis INTEGER NOT NULL,
    reseau_isolation isolation,
    reseau_bouclage bouclage,
    -- Stockage
    stockage_volume FLOAT,
    stockage_position_volume_chauffe BOOLEAN,
    -- References
    --FOREIGN KEY (ecs_id) REFERENCES ressource.ecs(id)
    --FOREIGN KEY (installation_id) REFERENCES ecs.installation(id)
    --FOREIGN KEY (generateur_id) REFERENCES ecs.generateur(id)
);