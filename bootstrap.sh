apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
apt-get install apt-transport-https ca-certificates
echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main" > /etc/apt/sources.list.d/passenger.list
add-apt-repository -y ppa:chris-lea/node.js
apt-get update && apt-get upgrade -y
apt-get install -y nginx libgdbm-dev libncurses5-dev automake libtool bison libffi-dev nginx-extras passenger git libpq-dev nodejs g++ postgresql libmysqlclient-dev imagemagick

#install tty.js
npm install -g tty.js

#create postgresql user and db
sudo -u postgres createuser vagrant
sudo -u postgres createdb --owner=vagrant vagrant

#create app dirs
mkdir /vagrant/logs
mkdir /vagrant/app

#set nginx configs
rsync -av /vagrant/config/nginx /etc/nginx/nginx.conf
rsync -av /vagrant/config/passenger.nginx /etc/nginx/sites-available/passenger
ln -s /etc/nginx/sites-available/passenger /etc/nginx/sites-enabled/passenger
rm /etc/nginx/sites-enabled/default

#set tty.js configs
mkdir /home/vagrant/.tty.js
rsync -av /vagrant/config/config.tty.js /home/vagrant/.tty.js/config.json
