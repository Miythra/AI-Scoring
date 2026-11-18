# IA Scoring — un « Nutri-Score » pour l'usage de l'IA

Projet RSE de 3e année à Télécom SudParis, en partenariat avec Sopra Steria.

**But :** construire une échelle de score (A → E) qui compare l'impact RSE de plusieurs plateformes d'IA générative sur un usage étudiant précis, et classer ces plateformes avec cette échelle.

Ce dépôt contient la partie technique du projet : le protocole de test, les données collectées, l'algorithme de scoring et l'analyse des résultats.

---

## Principes

- **Une unité de mesure par tâche réussie, pas par requête.** On note le coût d'une *tâche accomplie avec une qualité suffisante* (par ex. « un bug corrigé »). Une IA légère qui demande cinq échanges peut donc finir moins bien notée qu'une IA plus lourde qui réussit du premier coup. C'est notre façon de prendre en compte l'effet rebond.
- **On ne mesure pas, on estime.** Les plateformes ne publient pas leur consommation. On s'appuie sur des outils d'estimation reconnus (EcoLogits, AI Energy Score) et on indique un **niveau de confiance** pour chaque valeur.
- **Les tests restent sobres.** Jeu de prompts fixe, nombre d'essais défini à l'avance, pas de requêtes inutiles.
- **Tous les choix sont justifiés.** Le choix des critères, leurs poids et les seuils A–E sont des choix de valeurs : chacun est documenté et argumenté.

## Périmètre (à valider)

| Élément | Choix actuel | Statut |
|---|---|---|
| Cas d'usage | Déboguer un programme Python (+ éventuellement « résumer un cours ») | À valider |
| Plateformes | ChatGPT, Claude, Gemini, Le Chat (Mistral), Copilot, un petit modèle local (référence sobre) | À valider |
| Critères | Énergie / CO₂, matériel, fiabilité, effets sur l'apprentissage, données et éthique, souveraineté | À valider |
| Pondérations et seuils A–E | — | À définir |

## Format des données (proposition)

Une ligne par essai :

| Colonne | Description |
|---|---|
| `plateforme` | ex. ChatGPT |
| `modele` | ex. gpt-4o-mini |
| `cas_usage` | ex. debug_python |
| `prompt_id` | identifiant du prompt de test |
| `essai` | numéro de l'essai |
| `nb_requetes` | nombre d'échanges pour finir la tâche |
| `tokens_entree` / `tokens_sortie` | volume de texte échangé |
| `tache_reussie` | oui / non |
| `note_qualite` | note selon la grille de notation |
| `energie_wh` | énergie estimée |
| `co2_g` | émissions estimées (gCO₂e) |
| `source_estimation` | outil ou méthode utilisée |
| `confiance` | haute / moyenne / faible |

## Façon de travailler

- Branche `main` protégée : on passe par une branche + pull request, relue par un autre membre.
- Noms de branches : `protocole/...`, `scoring/...`, `data/...`, `docs/...`.
- Pas de clé d'API dans le dépôt : utiliser un fichier `.env`, non versionné.

## Références

- [EcoLogits](https://github.com/genai-impact/ecologits) — estimation des impacts environnementaux des requêtes aux API d'IA générative (GenAI Impact)
- [AI Energy Score](https://huggingface.github.io/AIEnergyScore/) — classement énergétique des modèles par tâche (Hugging Face)
- [ML.ENERGY Leaderboard](https://github.com/ml-energy/leaderboard) — consommation énergétique mesurée de modèles open source
