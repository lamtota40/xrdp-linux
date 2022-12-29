# xrdp-linux
if want install xrdp in linux just follow command this and input to CLI

sudo apt update
sudo apt upgrade
sudo apt-get install unzip wget

sudo apt install xrdp -y 
sudo usermod -a -G ssl-cert xrdp

sudo wget -q https://raw.githubusercontent.com/lamtota40/xrdp-linux/main/startwm.sh -O /etc/xrdp/startwm.sh
sudo systemctl restart xrdp
sudo ufw allow 3389/tcp
