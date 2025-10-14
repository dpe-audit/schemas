# Règles de validation

Règles de validation non couvertes par les schémas de données. Ces règles doivent être implémentées par le client.

### Localisation

##### /adresse/code_postal

- Validation de l'existence du code postal depuis le [découpage administratif](https://github.com/datagouv/decoupage-administratif).
- Validation de l'existence du code postal pour le code insee transmis depuis le [découpage administratif](https://github.com/datagouv/decoupage-administratif).

##### /adresse/code_insee

- Validation de l'existence du code insee depuis le [découpage administratif](https://github.com/datagouv/decoupage-administratif).
- Validation de l'existence du code insee pour le code postal transmis depuis le [découpage administratif](https://github.com/datagouv/decoupage-administratif).

### Réseaux de chaleur et de froid

##### /chauffage/generateur/position/reseau_chaleur_id

- Validation de l'existence du réseau de chaleur déclaré depuis [l'arrêté du 15 septembre 2006](https://www.legifrance.gouv.fr/loda/id/JORFTEXT000000788395/)

##### /ecs/generateur/position/reseau_chaleur_id

- Validation de l'existence du réseau de chaleur déclaré depuis [l'arrêté du 15 septembre 2006](https://www.legifrance.gouv.fr/loda/id/JORFTEXT000000788395/)

##### /refroidissement/generateur/reseau_froid_id

- Validation de l'existence du réseau de froid déclaré depuis [l'arrêté du 15 septembre 2006](https://www.legifrance.gouv.fr/loda/id/JORFTEXT000000788395/)

### Années de construction / rénovation / installation

##### /batiment/annee_construction

- Validation de la cohérence de l'année saisie par rapport à l'année en cours

##### /chauffage/emetteur/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /enveloppe/baie/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /enveloppe/mur/annee_construction

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /enveloppe/mur/annee_renovation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du mur

##### /enveloppe/plancher_bas/annee_construction

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /enveloppe/plancher_bas/annee_renovation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du mur

##### /enveloppe/plancher_haut/annee_construction

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /enveloppe/plancher_haut/annee_renovation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du mur

##### /enveloppe/baie/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /chauffage/emetteur/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /chauffage/installation/solaire_thermique/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /chauffage/generateur/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /ecs/installation/solaire_thermique/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /ecs/generateur/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /refroidissement/generateur/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

##### /ventilation/generateur/annee_installation

- Validation de la cohérence de l'année saisie par rapport à l'année en cours
- Validation de la cohérence de l'année saisie par rapport à l'année de construction du bâtiment

### Références internes

##### /chauffage/generateur/position/generateur_mixte_id

- Validation de l'existence du générateur d'eau chaude sanitaire référencé dans les données transmises

##### /chauffage/systeme/installation_id

- Validation de l'existence de l'installation de chauffage référencée dans les données transmises

##### /chauffage/systeme/generateur_id

- Validation de l'existence du générateur de chauffage référencé dans les données transmises

##### /chauffage/systeme/emetteurs

- Validation de l'existence des émetteurs référencés dans les données transmises

##### /ecs/generateur/position/generateur_mixte_id

- Validation de l'existence du générateur de chauffage référencé dans les données transmises

##### /ecs/systeme/installation_id

- Validation de l'existence de l'installation d'eau chaude sanitaire référencée dans les données transmises

##### /ecs/systeme/generateur_id

- Validation de l'existence du générateur d'eau chaude sanitaire référencé dans les données transmises

##### /refroidissement/systeme/installation_id

- Validation de l'existence de l'installation de refroidissement référencée dans les données transmises

##### /refroidissement/systeme/generateur_id

- Validation de l'existence du générateur de refroidissement référencé dans les données transmises

##### /refroidissement/installation/generateur_id

- Validation de l'existence du générateur de ventilation référencé dans les données transmises

##### /enveloppe/baie/position/local_non_chauffe_id

- Validation de l'existence du local non chauffé référencé dans les données transmises

##### /enveloppe/baie/position/paroi_id

- Validation de l'existence de la paroi référencée dans les données transmises

##### /enveloppe/mur/position/local_non_chauffe_id

- Validation de l'existence du local non chauffé référencé dans les données transmises

##### /enveloppe/plancher_bas/position/local_non_chauffe_id

- Validation de l'existence du local non chauffé référencé dans les données transmises

##### /enveloppe/plancher_haut/position/local_non_chauffe_id

- Validation de l'existence du local non chauffé référencé dans les données transmises

##### /enveloppe/porte/position/local_non_chauffe_id

- Validation de l'existence du local non chauffé référencé dans les données transmises

##### /enveloppe/porte/position/paroi_id

- Validation de l'existence de la paroi référencée dans les données transmises

##### /enveloppe/pont_thermique/liaison/mur_id

- Validation de l'existence de la paroi référencée dans les données transmises

##### /enveloppe/pont_thermique/liaison/plancher_id

- Validation de l'existence de la paroi référencée dans les données transmises

##### /enveloppe/pont_thermique/liaison/ouverture_id

- Validation de l'existence de la paroi référencée dans les données transmises
