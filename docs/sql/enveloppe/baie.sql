DROP TABLE IF EXISTS enveloppe.baie;

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

CREATE TYPE type_fermeture as ENUM(
    'sans_fermeture',
    'jalousie_accordeon',
    'fermeture_lames_orientables',
    'venitiens_exterieurs_metal',
    'volet_battant_avec_ajours_fixes',
    'persiennes_avec_ajours_fixes',
    'fermeture_sans_ajours',
    'volets_roulants_aluminium',
    'volets_roulants_pvc_bois_epaisseur_lte_12_mm',
    'volets_roulants_pvc_bois_epaisseur_gt_12_mm',
    'persienne_coulissante_epaisseur_lte_22_mm',
    'persienne_coulissante_epaisseur_gt_22_mm',
    'volet_battant_pvc_bois_epaisseur_lte_22_mm',
    'volet_battant_pvc_bois_epaisseur_gt_22_mm',
    'fermeture_isolee_sans_ajours'
);

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

CREATE TABLE enveloppe.baie (
    id UUID PRIMARY KEY,
    enveloppe_id UUID NOT NULL,
    double_fenetre_id UUID,
    description VARCHAR(255) NOT NULL,
    type type_baie,
    presence_protection_solaire BOOLEAN NOT NULL,
    type_fermeture type_fermeture NOT NULL,
    annee_installation INT,
    ug FLOAT,
    uw FLOAT,
    ujn FLOAT,
    sw FLOAT,
    -- Position
    position_paroi_id UUID,
    position_local_non_chauffe_id UUID,
    position_surface FLOAT NOT NULL,
    position_mitoyennete mitoyennete NOT NULL,
    position_orientation FLOAT,
    position_inclinaison FLOAT NOT NULL,
    position_type_pose type_pose,
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
    data_deltar FLOAT,
    data_fe FLOAT,
    data_sw FLOAT,
    data_sse FLOAT,
    -- References
    --FOREIGN KEY (enveloppe_id) REFERENCES ressource.enveloppe(id)
    --FOREIGN KEY (position_local_non_chauffe_id) REFERENCES enveloppe.local_non_chauffe(id)
);