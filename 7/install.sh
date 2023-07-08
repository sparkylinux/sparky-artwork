#!/bin/sh
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License as
#  published by the Free Software Foundation; either version 2 of the
#  License, or (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software Foundation,
#  Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA

if [ "$1" = "uninstall" ]; then
   	rm -f /usr/share/pixmaps/sparky.png
	rm -f /usr/share/pixmaps/sparky24px.png
	rm -f /opt/panel/sparky-menu.png
	rm -f /opt/artwork/sparky-base.png
	rm -f /opt/artwork/sparky-grub.png
	rm -f /opt/artwork/sparky-menu.png
	rm -f /opt/artwork/sparky-desktop.png
	rm -f /opt/artwork/sparky-lightdm.svg
	rm -f /opt/locker/sparky-lock.png
else
	cp pixmaps/* /usr/share/pixmaps/
	if [ ! -d /opt/panel ]; then
		mkdir -p /opt/panel
	fi
	cp opt/sparky-menu.png /opt/panel/
	if [ ! -d /opt/artwork ]; then
		mkdir -p /opt/artwork
	fi
	cp opt/sparky-base.png /opt/artwork/
	ln -s /opt/artwork/sparky-base.png /opt/artwork/sparky-desktop.png
	cp opt/sparky-grub.png /opt/artwork/
	cp opt/sparky-lightdm.svg /opt/artwork/
	if [ ! -d /usr/share/backgrounds ]; then
		mkdir -p /usr/share/backgrounds
	fi
	if [ ! -f /usr/share/backgrounds/default.jpg ]; then
		ln -s /opt/artwork/sparky-base.jpg /usr/share/backgrounds/default.jpg
	fi
	if [ ! -d /opt/locker ]; then
		mkdir -p /opt/locker
	fi
	cp opt/sparky-lock.png /opt/locker/
fi
