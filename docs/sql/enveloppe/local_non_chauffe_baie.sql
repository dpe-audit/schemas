DROP TABLE IF EXISTS enveloppe.local_non_chauffe_baie;

CREATE TYPE materiau as ENUM(
    'polycarbonate',
    'pvc',
    'bois',
    'bois_metal',
    'metal'
);

CREATE TYPE type_vitrage as ENUM(
    'polycarbonate',
    'simple_vitrage',
    'double_vitrage',
    'double_vitrage_fe',
    'triple_vitrage',
    'triple_vitrage_fe'
);

CREATE TYPE mitoyennete as ENUM(
    'exterieur',
    'enterre',
    'vide_sanitaire',
    'terre_plein',
    'local_non_chauffe',
    'local_chauffe',
    'local_non_accessible'
);

CREATE TABLE enveloppe.local_non_chauffe_baie (
    id UUID PRIMARY KEY NOT NULL,
    local_non_chauffe_id UUID NOT NULL,
    description TEXT NOT NULL,
    materiau materiau NOT NULL,
    type_vitrage type_vitrage,
    presence_rupteur_pont_thermique BOOLEAN,
    -- Position
    position_surface FLOAT NOT NULL,
    position_mitoyennete mitoyennete NOT NULL,
    position_orientation FLOAT,
    position_inclinaison FLOAT NOT NULL,
    -- References
    --FOREIGN KEY (local_non_chauffe_id) REFERENCES enveloppe.local_non_chauffe(id)
);