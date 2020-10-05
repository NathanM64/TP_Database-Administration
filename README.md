# TP_Database-Administration

## Premiere Partie:
- touch Dockerfile
  - Création du fichier dockerfile, avec l'image mysql:latest
  - Ajout des commands apt-get update && apt-get install -y cron logrotate vim
- touch docker-compose.yml

## Deuxième Parie:
- Executé la commande crontab -e
- Ajouté la ligne "1 * * * 1 mysqldump -uroot -ppassword --all-databases | gzip -9 -c > all_databases.sql.gz"
- 
