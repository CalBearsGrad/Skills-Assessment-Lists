# Hackbright linux setup script
#
# Joel Burton <joel@hackbrightacademy.com> and
# Katie Byers <katiebyers@hackbrightacademy.com>
#
#
# This script is to be run either:
# - after installing a fresh Ubuntu installation on lab computers (as super user: $ sudo bash hb-linux-setup.sh)
# - by Vagrant as the first step of provisioning when first running 'vagrant up'
#
# Only things specific for HB Linux installs (and things used for student Vagrant setup, etc) should be included

# Using set -e will make the script exit if any line gives as non-zero return
set -e

# ensure that environment and Postgres default to UTF-8
echo "LANG=en_US.UTF-8" > /etc/default/locale
echo "LANGUAGE=en_US.UTF-8:" >> /etc/default/locale

#update package listings
echo -e "\nUpdating package listings\n"
sudo apt-get update

# get nodejs - nodejs site recomend using curl over 'add-apt-repository'
# see https://nodejs.org/en/download/package-manager/
# running curl in 's' silent and 'L' location - if 3## in response resource
# has been moved and curl will look at the redirect location.
echo -e "\nGetting nodejs packages\n"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -

#at this point running the following (sudo apt-get install nodejs ) will 
#install node AND npm -- We run this step during install of Linux 
#packages. In the future, you may need to install npm as well

#install useful linux packages
echo -e "\nIstalling Linux packages\n"
sudo apt-get install -y git python-dev python-pip python-virtualenv sqlite3 libxml2-dev libxslt1-dev libffi-dev nodejs libssl-dev postgresql-client postgresql postgresql-contrib postgresql-plpython postgresql-server-dev-9.5

# upgrade to most recent pip
echo -e "\nUpgrading pip\n"
sudo pip install -U pip

# install useful python packages
echo -e "\nInstalling Python packages"
sudo pip install psycopg2 ipython notebook python-twitter

echo "*************************************"
echo "Setup complete. No errors encountered"
echo "*************************************"
