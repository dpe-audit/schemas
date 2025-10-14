DROP TABLE IF EXISTS enveloppe.porte;

CREATE TYPE type_pose as ENUM('nu_exterieur', 'nu_interieur', 'tunnel');

CREATE TYPE isolation as ENUM('isole', 'non_isole');

CREATE TYPE materiau as ENUM('pvc', 'bois', 'bois_metal', 'metal');

CREATE TYPE type_vitrage as ENUM('simple_vitrage', 'double_vitrage', 'triple_vitrage');

CREATE TYPE mitoyennete as ENUM(
    'exterieur',
    'enterre',
    'vide_sanitaire',
    'terre_plein',
    'sous_sol_non_chauffe',
    'local_non_chauffe',
    'local_non_residentiel',
    'local_residentiel',
    'local_non_accessible'
);

CREATE TYPE performance as ENUM(
    'tres_bonne',
    'bonne',
    'moyenne',
    'insuffisante',
);

CREATE TABLE enveloppe.porte (
    id UUID PRIMARY KEY,
    enveloppe_id UUID NOT NULL,
    description VARCHAR(255) NOT NULL,
    isolation isolation,
    materiau materiau,
    annee_installation INT,
    u FLOAT,
    -- Position
    position_paroi_id UUID,
    position_local_non_chauffe_id UUID,
    position_surface FLOAT NOT NULL,
    position_mitoyennete mitoyennete NOT NULL,
    position_orientation FLOAT,
    position_presence_sas BOOLEAN NOT NULL,
    position_type_pose type_pose,
    -- Menuiserie
    menuiserie_largeur_dormant FLOAT,
    menuiserie_presence_joint BOOLEAN,
    menuiserie_presence_retour_isolation BOOLEAN,
    -- Vitrage
    vitrage_surface FLOAT NOT NULL,
    vitrage_type type_vitrage,
    -- Donénes calculées
    data_u FLOAT NOT NULL,
    data_b FLOAT NOT NULL,
    data_sdep FLOAT NOT NULL,
    data_dp FLOAT NOT NULL,
    data_performance performance NOT NULL,
    -- Références
    --FOREIGN KEY (enveloppe_id) REFERENCES ressource.enveloppe(id)
    --FOREIGN KEY (position_local_non_chauffe_id) REFERENCES enveloppe.local_non_chauffe(id)
);