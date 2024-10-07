#!/bin/bash
set -e

lb config \
		--apt apt \
		--architecture amd64 \
		--distribution stable \
		--parent-archive-areas "main contrib non-free non-free-firmware" \
		--mirror-bootstrap "http://deb.debian.org/debian" \
		--mirror-chroot "http://deb.debian.org/debian" \
		--bootappend-live "boot=live components locales=ja_JP.UTF-8 timezone=Asia/Tokyo keyboard-layouts=jp debug=1" \
		--binary-image iso \

sudo lb build
