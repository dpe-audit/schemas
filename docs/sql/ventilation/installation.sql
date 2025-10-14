DROP TABLE IF EXISTS ventilation.installation;

CREATE TYPE type_ventilation as ENUM(
    'ventilation_mecanique',
    'ventilation_naturelle_ouverture_fenetres',
    'ventilation_naturelle_entrees_air_hautes_basses',
    'ventilation_naturelle_conduit',
    'ventilation_naturelle_conduit_entrees_air_hygroreglables',
);

CREATE TABLE ventilation.installation (
    id UUID PRIMARY KEY,
    ventilation_id UUID NOT NULL,
    generateur_id UUID,
    description TEXT NOT NULL,
    surface FLOAT NOT NULL,
    type type_ventilation NOT NULL,
    -- Données calculées
    data_rdim FLOAT,
    data_qvarep_conv FLOAT,
    data_qvasouf_conv FLOAT,
    data_smea_conv FLOAT,
    -- Reference
    --FOREIGN KEY (ventilation_id) REFERENCES ressource.ventilation(id)
    --FOREIGN KEY (generateur_id) REFERENCES ventilation.generateur(id)
);