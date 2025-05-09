# xrdp-linux
if want install xrdp in linux just follow command this and input to CLI

step 1:
```console
apt update && apt upgrade -y
```
step 2:
```console
sudo apt install xrdp unzip wget-y 
sudo usermod -a -G ssl-cert xrdp
sudo wget -q https://raw.githubusercontent.com/lamtota40/xrdp-linux/main/startwm.sh -O /etc/xrdp/startwm.sh
sudo systemctl restart xrdp
sudo systemctl enable xrdp
sudo ufw allow 3389/tcp
```

# Client XRDP
https://play.google.com/store/apps/details?id=com.microsoft.rdc.android
