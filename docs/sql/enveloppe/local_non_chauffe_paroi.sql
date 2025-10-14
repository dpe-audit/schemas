DROP TABLE IF EXISTS enveloppe.local_non_chauffe_paroi;

CREATE TYPE isolation as ENUM('isole', 'non_isole');

CREATE TYPE mitoyennete as ENUM(
    'exterieur',
    'enterre',
    'vide_sanitaire',
    'terre_plein',
    'local_non_chauffe',
    'local_chauffe',
    'local_non_accessible'
);

CREATE TABLE enveloppe.local_non_chauffe_paroi (
    id UUID PRIMARY KEY NOT NULL,
    local_non_chauffe_id UUID NOT NULL,
    description TEXT NOT NULL,
    isolation isolation,
    -- Position
    position_surface FLOAT NOT NULL,
    position_mitoyennete mitoyennete NOT NULL,
    -- References
    --FOREIGN KEY (local_non_chauffe_id) REFERENCES enveloppe.local_non_chauffe(id)
);