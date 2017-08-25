# clear terminal window
clear

# install nodejs, anticipating next lts release
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

#nodejs dev tools
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
sudo yarn add -g -y nodemon
sudo yarn install -g -y n

#nodejs latest long term support
sudo n lts

#install typescript
sudo yarn add -g -y typescript
#typescript for nodejs
sudo yarn add -g -y @types/npm

#install DB 
#mongodb
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
#echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
#sudo apt-get update
#sudo apt-get install -y mongodb-org

#postgres, only for ubuntu! otherwise do it manually
#apt-get install postgresql-9.6

#redis
#wget http://download.redis.io/releases/redis-4.0.1.tar.gz
#tar xzf redis-4.0.1.tar.gz
#cd redis-4.0.1
#make
