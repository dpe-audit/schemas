# Différences entre les schémas de données

Cette partie traite des principales différences entre le standard de données en vigueur et celui proposé. Ces différences sont la conséquence de choix que nous essaierons d'expliciter au mieux.

## Suppression des données d'entrée à faible valeur informative

Afin de juger de la valeur informative des données d'entrée, nous nous référons aux critères suivants :

**Fiabilité** : La donnée collectée est-elle fiable, ou participe-t-elle à fiabiliser un ensemble de données dans lequel elle s'inscrit ? Ce critère est écarté, considérant que la fiabilité des informations collectées est héritée de l'autorité conférée aux producteurs de données.

**Pertinence** : La donnée collectée est-elle contextualisée, dépendante de la situation décrite ?

**Qualité** : La donnée collectée est-elle conforme aux usages prévus ?

**Pérennité** : La donnée collectée conserve-t-elle une valeur informative après expiration ?

### Liste des données d'entrée supprimées

| Données                            | Pertinence | Qualité | Pérennité |
| ---------------------------------- | :--------: | :-----: | :-------: |
| Vue d'ensemble du logement         |   Faible   | Faible  |  Faible   |
| Descriptifs simplifiés             |   Faible   | Faible  |  Faible   |
| Fiches techniques                  |   Faible   | Faible  |  Faible   |
| Justificatifs                      |   Faible   | Faible  |  Faible   |
| Descriptifs des gestes d'entretien |   Faible   |  Forte  |  Faible   |

## Découplage des scénarios de travaux

La principale différence entre un DPE et un Audit réglementaire est la projection des performances énergétiques sur la base de scénarios de travaux. Dans le modèle standard, ces scénarios sont collectés en associant les éléments descriptifs du bâtiment ou du logement à un scénario de travaux pré-établi (une énumération). Ainsi l'état initial est différencié d'une projection par la valeur de son énumération.

Cette approche pose plusieurs problèmes :

- **Inconsistance** : Une situation initiale ne peut être considérée comme une source de vérité pour l'établissement de plusieurs scénarios de travaux par des producteurs de données différents. Chaque nouveau scénario établi sur la base d'une situation initiale inchangée implique de reproduire l'ensemble des données, et donc d'avoir n représentations d'une même situation.

- **Lisibilité** : Un scénario de travaux est représenté par le terme "logement". Une donnée Audit contient ainsi une liste de plusieurs "logements" dont un correspond à l'état initial. Il est ainsi nécessaire de lire la documentation pour ne pas mésinterpréter la donnée (on pourrait penser que chaque élément "logement" représente un logement dans un bâtiment).

Le modèle de données que nous proposons **isole les scénarios de travaux** de la situation initiale du bâtiment ou du logement. 
