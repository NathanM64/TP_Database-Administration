## TP 4 | Database Administration
---------------------------------
### Première partie :
---------------------
- touch Dockerfile
  - FROM mysql:latest
  - RUN apt-get update && apt-get install -y cron logrotate vim
- touch docker-compose.yml
  - version:  '3.7'
  - services:
    - mysql:
    - container_name: server
    - restart: on-failure
    - build:
    - context: ./
    - dockerfile: Dockerfile
    - volumes:
      - - ./mysql:/docker/var/lib/mysql
    - working_dir: /mysql
    - environment:
      - MYSQL_ROOT_PASSWORD: password
  
## Deuxième partie :
--------------------
- Lancer le docker-compose
- sudo docker-compose exec mysql bash
  - Dans bash, lancer la commande crontab -e
  - Définir une stratégie de backups qui génère un dump de la base de données tous les lundis à 17h
  - * 17 * * 1 mysqldump -uroot -ppassword --all-databases | gzip -9 -c > /backups/all_databases"$(date +%Y-%m-%d)".sql.gz
  - Executer: service cron start
- Toutes cette partie auparavant aurait pu être défini dans le dockerfile, à l'aide de la commande CMD

## Troisième partie :
---------------------
- Dans docker bash, exécuter la commande: CD /etc/logrotate.d/
- Créer une nouvelle configuration: touch backup-daily
- Configurer le nouveau fichier: nano backup-daily
  - daily
  - missingok
  - rotate 5
  - compresscmd     /usr/bin/bzip2
  - delaycompress
  - notiempty
  - create 640 root adm
- Pour tester notre configuration executer: logrotate -f /etc/logrotate.d/backup-daily
