gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 || curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
curl -L https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm

rvm install 2.2.1

rvm use 2.2.1 --default
gem install bundler
gem install rake
