#!/bin/sh

echo "#====================================="
echo "# setting KDE4 desktop background     "
echo "#-------------------------------------"


if [ -d "/usr/share/kde4/" ] && [ -d "/etc/kde4/" ]; then
	# Background
	sed -i 's#wallpaper=/usr/share/wallpapers/.*#wallpaper=/usr/share/wallpapers/RadicOSdefault/contents/images/1920x1200.jpg#g' /etc/kde4/share/config/plasmarc
	sed -i 's#wallpaper=/usr/share/wallpapers/.*#wallpaper=/usr/share/wallpapers/RadicOSdefault/contents/images/1920x1200.jpg#g' /etc/kde4/share/config/plasma-desktoprc

fi
