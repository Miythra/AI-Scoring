#!/usr/bin/env bash
# Crée la structure du dépôt IA Scoring. À lancer dans un dossier vide contenant README.md.
set -e

mkdir -p data/raw data/processed protocole scoring notebooks docs
touch data/raw/.gitkeep data/processed/.gitkeep protocole/.gitkeep scoring/.gitkeep notebooks/.gitkeep

cat > docs/decisions.md <<'EOF'
# Journal des décisions

| Date | Décision | Justification | Auteur |
|---|---|---|---|
| 2026-11-18 | Unité de mesure : la tâche réussie, pas la requête | Prendre en compte l'effet rebond et le nombre d'échanges | Aurélien |
EOF

cat > .gitignore <<'EOF'
.venv/
__pycache__/
.ipynb_checkpoints/
.env
*.pyc
.DS_Store
EOF

cat > requirements.txt <<'EOF'
pandas
matplotlib
jupyter
ecologits
python-dotenv
EOF

git init -b main
git add .
git commit -m "Initialisation du dépôt : README, structure, journal des décisions"
echo "OK. Crée le dépôt vide sur GitHub puis :"
echo "  git remote add origin git@github.com:<toi>/ia-scoring.git && git push -u origin main"
