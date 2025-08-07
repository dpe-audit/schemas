<div align="center">
    <img width="auto" height="180" src="https://raw.githubusercontent.com/dpe-audit/.github/refs/heads/main/assets/logo.svg" alt="DPE-Audit">
</div>
<p align="center">
	<a href="https://github.com/dpe-audit">
		Projet
	</a>&nbsp;&nbsp;&nbsp;
	<a href="https://github.com/dpe-audit/api">
		API
	</a>&nbsp;&nbsp;&nbsp;
	<a href="https://github.com/dpe-audit/api">
		Démo
	</a>&nbsp;&nbsp;&nbsp;
	<a href="https://github.com/dpe-audit/documentation">
		Documentation
	</a>&nbsp;&nbsp;&nbsp;
	<a href="https://github.com/dpe-audit/migration">
		Migration
	</a>
</p>
<p align="center">
	<a href="https://github.com/dpe-audit/schemas">
		Schémas
	</a>&nbsp;&nbsp;&nbsp;
	<a href="https://github.com/dpe-audit/opendata">
		Données ouvertes
	</a>&nbsp;&nbsp;&nbsp;
	<a href="https://github.com/dpe-audit/methode-3cl">
		Méthode 3CL
	</a>
</p>

# DPE-Audit - Schémas de données publiques

Standard de données publiques pour la description thermique des bâtiments (données d'entrée).

> [!IMPORTANT]
> Ce projet est actuellement en cours de développement.

## Installation

```
git clone https://github.com/dpe-audit/schemas dpe-audit-schemas
cd dpe-audit-schemas
npm i
npm run build
```

## Commandes

```
npm run validate // Valide les exemples de données
npm run build // Déréférence le schéma de données aux formats JSON et YAML
```

## Organisation

/examples : Exemples de données valide
/lib : Sous-schémas de données

## Documentation

### Technologies

- JSON Schema

### Conventions de nommage

- les noms des propriétés sont écrits en snake_case - ex `annee_construction` ou `type_isolation`.
- les définitions internes sont écrites en camelCase - ex `#/$defs/localNonChauffe`
- les énumérations sont écrites en snake_case - ex `iti` ou `brique_pleine_simple`

### Traitement des données requises et inconnues

Par défaut, on considère que **toutes les propriétés décrites par un schéma applicable `DOIVENT` être définies**.

Un schéma **PEUT** décrire une propriété acceptant une valeur `null` indiquant une donnée d'entrée inconnue du producteur. Ces valeurs `DOIVENT` être définies par le producteur. Ces schémas `DOIVENT` être complétés d'une valeur par défaut `default: null`.
