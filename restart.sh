cat /vagrant/config/env.global > /etc/profile.d/appenv.sh

if [ /vagrant/config/private.key ]; then
    rsync /vagrant/config/private.key /home/vagrant/.ssh/id_rsa
fi

source /etc/profile
service nginx restart
