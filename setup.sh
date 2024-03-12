#!/bin/bash
echo -e 'This file is used to setup the Case Flow Management System server on your machine.\nPlease ensure strong data connectivity.\nWARNING: The python packages installed will bypass the virtual environment restrictions.'
read -p 'Would you like to continue with the installation(Y/N)? ' choice
if [ "$choice" == "Y" -o "$choice" == "y" ];
then
    echo -e '\nInstalling python\n'
    sudo apt-get install -y python3-full
    echo -e '\nInstalling pip\n'
    sudo apt-get install -y python3-pip
    echo -e '\nInstalling postgresql\n'
    sudo apt-get install -y postgresql
    sudo apt-get install -y postgresql-contrib
    sudo apt-get install -y libpq-dev
    echo -e '\nInstalling tesseract\n'
    sudo apt-get install -y tesseract-ocr
    echo -e '\nInstalling django\n'
    pip3 install django --break-system-packages
    echo -e '\nInstalling sql-interface\n'
    pip3 install psycopg2 --break-system-packages
    echo -e '\nInstalling docquery\n'
    pip3 install docquery[donut] --timeout=100000 --break-system-packages
    echo -e '\nInitializing database\n'
    sudo service postgresql start
    sudo -u postgres psql -f db_initialize.sql
    sudo service postgresql stop
    echo -e '\nSetup Complete'
fi
