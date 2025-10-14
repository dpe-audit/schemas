DROP TABLE IF EXISTS enveloppe.baie_masque;

CREATE TABLE enveloppe.baie_masque (
    id INTEGER PRIMARY KEY,
    baie_id UUID NOT NULL,
    masque_id UUID NOT NULL,
    -- References
    --FOREIGN KEY (baie_id) REFERENCES enveloppe.baie(id)
    --FOREIGN KEY (masque_id) REFERENCES enveloppe.masque(id)
);