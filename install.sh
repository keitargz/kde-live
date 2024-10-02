sudo apt-get install wget gpg
# VSCode repository settings
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg ./config/archives/vscode.key.chroot
cp ./config/archives/vscode.key.chroot ./config/archives/vscode.key.binary
rm -f packages.microsoft.gpg

# Chrome repository settings
wget -qO- https://dl-ssl.google.com/linux/Linux_signing_key.pub > config/archives/chrome.key.chroot
cp ./config/archives/chrome.key.chroot ./config/archives/chrome.key.binary

# config
lb config \
		--apt apt \
		--architecture amd64 \
		--distribution stable \
		--parent-archive-areas "main contrib non-free non-free-firmware" \
		--mirror-bootstrap "http://deb.debian.org/debian" \
		--mirror-chroot "http://deb.debian.org/debian" \
		--bootappend-live "boot=live components locales=ja_JP.UTF-8 timezone=Asia/Tokyo keyboard-layouts=jp debug=1" \
		--binary-image iso \
