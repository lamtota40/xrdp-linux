sudo apt install xrdp
echo "startxfce4" > ~/.xsession
sed -i -e '/\. \/etc\/profile/a unset DBUS_SESSION_ADDRESS' -e '/unset DBUS_SESSION_ADDRESS/a unset XDG_RUNTIME_DIR' /etc/xrdp/startwm.sh

sudo chown xrdp:xrdp /etc/xrdp/key.pem
sudo chmod 600 /etc/xrdp/key.pem
sudo chown xrdp:xrdp /var/run/xrdp
sudo usermod -a -G ssl-cert xrdp
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart xrdp xrdp-sesman
