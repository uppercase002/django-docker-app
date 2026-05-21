# on utilise l'image de ubuntu
FROM ubuntu

# on définit notre zone de travaille
WORKDIR /app

# on copie tout les requirement dans app
COPY requirement.txt /app/

# on execute les commandes (update et installation de python et pip)
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

RUN source ./venv/bin/activate

# on isntalle les requirement disponible
RUN pip install --no-cache-dir -r requirement.txt

# on copie la suite des fichiers dans app
COPY . /app/

# on expose le port sur lequel tournera notre application django
EXPOSE 8000

# on définit le entrypoint de notre application (sera static tout au long de l'execution de notre container)
# il définit le programme fixe du container
ENTRYPOINT [ "python3", "manage.py" ]

# on définti egalement le CMD 
# peut-être modifiée, elle sert de commande par défaut
CMD [ "runserver", "0.0.0.0:8000" ]

