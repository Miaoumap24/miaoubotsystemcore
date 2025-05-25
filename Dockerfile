# Utilise une image Python officielle légère comme base
FROM python:3.9-slim-buster

# Définit le répertoire de travail à l'intérieur du conteneur
WORKDIR /app

# Copie le fichier requirements.txt et installe les dépendances
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copie tout le reste de votre code source dans le conteneur
COPY . .

# Indique que le conteneur écoutera sur le port défini par Render (variable d'environnement $PORT)
EXPOSE 8000 

# Commande pour démarrer votre application Flask (si elle s'appelle app.py et l'instance Flask est 'app')
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:8000"]

# Si vous utilisez FastAPI (par exemple, main.py avec une instance 'app'), utilisez plutôt ceci :
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
