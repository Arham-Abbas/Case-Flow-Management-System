#!/bin/bash
echo 'Starting the Case Flow Management Server. Press Ctrl + C to stop.'
echo -e 'Starting database server'
sudo service postgresql start
echo -e 'Migrating django project files\n'
python3 web/manage.py makemigrations
python3 web/manage.py migrate
python3 engine1/manage.py makemigrations
python3 engine1/manage.py migrate
python3 engine2/manage.py makemigrations
python3 engine2/manage.py migrate
python3 engine3/manage.py makemigrations
python3 engine3/manage.py migrate
echo -e '\nStarting django servers\n'
honcho start -f Procfile.dev
echo -e '\nStopped django servers'
sudo service postgresql stop
echo -e 'Stopped database server'
