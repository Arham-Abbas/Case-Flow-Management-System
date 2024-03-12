#!/bin/bash
echo 'Starting the Case Flow Management Server. Press Ctrl + C to stop.'
sudo service postgresql start
honcho start -f Procfile.dev
