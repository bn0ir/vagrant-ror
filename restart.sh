cat /vagrant/config/env.global > /etc/profile.d/appenv.sh
source /etc/profile
service nginx restart
