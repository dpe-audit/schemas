DROP TABLE IF EXISTS enveloppe.double_fenetre;

CREATE TYPE type_baie as ENUM(
    'brique_verre_pleine',
    'brique_verre_creuse',
    'polycarbonate',
    'fenetre_battante',
    'fenetre_coulissante',
    'porte_fenetre_coulissante',
    'porte_fenetre_battante'
);

CREATE TYPE type_pose as ENUM('nu_exterieur', 'nu_interieur', 'tunnel');

CREATE TYPE materiau as ENUM('pvc', 'bois', 'bois_metal', 'metal');

CREATE TYPE type_vitrage as ENUM(
    'polycarbonate',
    'brique_verre',
    'simple_vitrage',
    'double_vitrage',
    'double_vitrage_fe',
    'triple_vitrage',
    'triple_vitrage_fe'
);

CREATE TYPE nature_gaz_lame as ENUM(
    'air',
    'argon',
    'krypton'
);

CREATE TYPE type_survitrage as ENUM(
    'survitrage_simple',
    'survitrage_fe'
);

CREATE TABLE enveloppe.double_fenetre (
    id UUID PRIMARY KEY,
    enveloppe_id UUID NOT NULL,
    description VARCHAR(255) NOT NULL,
    type type_baie,
    ug FLOAT,
    uw FLOAT,
    sw FLOAT,
    -- Position
    position_type_pose type_pose,
    position_inclinaison FLOAT NOT NULL,
    position_presence_soubassement BOOLEAN,
    -- Vitrage
    vitrage_type type_vitrage,
    vitrage_nature_lame nature_gaz_lame,
    vitrage_epaisseur_lame FLOAT,
    -- Survitrage
    survitrage_type type_survitrage,
    survitrage_epaisseur_lame FLOAT,
    -- Menuiserie
    menuiserie_materiau materiau,
    menuiserie_largeur_dormant FLOAT,
    menuiserie_presence_joint BOOLEAN,
    menuiserie_presence_retour_isolation BOOLEAN,
    menuiserie_presence_rupteur_pont_thermique BOOLEAN,
    -- Données calculées
    data_ug FLOAT,
    data_uw FLOAT,
    data_sw FLOAT,
    -- References
    --FOREIGN KEY (enveloppe_id) REFERENCES ressource.enveloppe(id)
);