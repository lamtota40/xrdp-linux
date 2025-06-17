sudo apt install xrdp

declare -A de_map=(
  [startlxde]="exec startlxde"
  [startxfce4]="exec startxfce4"
  [startkde]="exec startkde"
  [startplasma-x11]="exec startplasma-x11"
  [mate-session]="exec mate-session"
  [gnome-session]="exec gnome-session"
  [startfluxbox]="exec startfluxbox"
  [openbox-session]="exec openbox-session"
)

found=0

for de in "${!de_map[@]}"; do
  if command -v "$de" &>/dev/null; then
    echo "${de_map[$de]}" > ~/.xsession
    echo "[INFO] Desktop detected: $de"
    echo "[INFO] ~/.xsession set to: ${de_map[$de]}"
    found=1
    break
  fi
done

if [ "$found" -eq 0 ]; then
  echo "[ERROR] Tidak ditemukan desktop environment yang dikenali."
  echo "Harap instalasi LXDE, XFCE, GNOME, dll terlebih dahulu."
fi

sudo cp /etc/xrdp/startwm.sh /etc/xrdp/startwm.sh.bak
sed -i -e '/\. \/etc\/profile/a unset DBUS_SESSION_ADDRESS' -e '/unset DBUS_SESSION_ADDRESS/a unset XDG_RUNTIME_DIR' /etc/xrdp/startwm.sh
sed -i 's|^exec /bin/sh /etc/X11/Xsession|#exec /bin/sh /etc/X11/Xsession|' /etc/xrdp/startwm.sh
sudo chown xrdp:xrdp /etc/xrdp/key.pem
sudo chmod 600 /etc/xrdp/key.pem
sudo chown xrdp:xrdp /var/run/xrdp
sudo usermod -a -G ssl-cert xrdp
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable xrdp
sudo systemctl restart xrdp xrdp-sesman
