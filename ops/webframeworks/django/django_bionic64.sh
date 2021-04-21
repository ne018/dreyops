
sudo apt update;sudo apt upgrade -y

sudo apt install git curl unzip -y

sudo apt install software-properties-common

sudo add-apt-repository ppa:deadsnakes/ppa

sudo apt update -y
sudo apt install python3.8 -y

sudo apt install python3-pip python3-dev libpq-dev nginx -y

# upgrade pip
sudo -H pip3  install --upgrade pip

# python3 -V

# install django
# pip3 install django

# verify version
# python3 -m django --version

# create a django project
# python3 -m django startproject mydjangoapp


# testing for development server via vagrant
# make sure you've open the port you will use

# produce all installed packages from existed project
# pip3 freeze > requirements

# install all packages from requirements 
# pip3 install -r requirements.txt

# install all packages line by line using cat
# cat requirements.txt | xargs -n 1 pip3 install


#mysql setup dependencies
sudo apt install libmysqlclient-dev -y
pip3 install mysqlclient

pip3 django gunicorn psycopg2-binary


# running in background
sudo apt install supervisor

# test it
gunicorn --bind 0.0.0.0:9000 project.wsgi

# set your supervisor for gunicorn
sudo nano /etc/supervisor/conf.d/gunicorn.conf

# here is the content
[program:project]
directory=/opt/djfiles/project
command=/usr/local/bin/gunicorn project.wsgi:application --workers 3 --bind 127.0.0.1:9000 --log-level info;
stdout_logfile = /opt/djfiles/project/logs/gunicorn/access.log
stderr_logfile = /opt/djfiles/project/logs/gunicorn/error.log
stdout_logfile_maxbytes=5000000
stderr_logfile_maxbytes=5000000
stdout_logfile_backups=100000
stderr_logfile_backups=100000
autostart=true
autorestart=true
startsecs=10
stopasgroup=true
priority=99


# re read the config
sudo supervisorctl reread

# update
sudo supervisorctl update

# start the project
sudo supervisorctl start project

# test it!


