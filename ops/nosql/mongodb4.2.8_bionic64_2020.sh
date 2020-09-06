echo "let's update your node"
sudo apt update -y

echo "let's upgrade your node"
sudo apt upgrade -y

sudo apt update -y
echo "let's start preparing the mongodb resources"

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update -y

echo "installing your mongodb"
sudo apt-get install -y mongodb-org

# put this system controller for mongodb manually
#sudo systemctl enable mongod
#sudo systemctl start mongod
#sudo systemctl stop mongod
#sudo systemctl restart mongod

# drey
