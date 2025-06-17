echo "startxfce4" > ~/.xsession

sudo chown xrdp:xrdp /etc/xrdp/key.pem
sudo chmod 600 /etc/xrdp/key.pem
sudo chown xrdp:xrdp /var/run/xrdp
sudo usermod -a -G ssl-cert xrdp
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart xrdp xrdp-sesman
