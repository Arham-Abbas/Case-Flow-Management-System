#!/bin/bash
echo 'This file is used to setup the Case Flow Management System server on your machine. Please ensure strong data connectivity.'
read -p 'Would you like to continue with the installation(Y/N)?' choice
if [ '$choice' == 'Y' || '$choice' == 'y' ];
then
    sudo apt-get install -y python3-full
    sudo apt-get install -y python3-pip
    sudo apt-get install -y postgresql
    sudo apt-get install -y postgresql-contrib
    sudo apt-get install -y libpq-dev
    sudo apt-get install -y tesseract-ocr
    pip3 install django --break-system-packages
    pip3 install psycopg2 --break-system-packages
    pip3 install docquery[donut] --timeout=100000 --break-system-packages
    sudo service postgresql start
    sudo -u postgres psql db_initialize.sql
