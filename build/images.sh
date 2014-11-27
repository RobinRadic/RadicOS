#!/bin/bash
# ======================================
#
# Documentation: http://doc.opensuse.org/projects/kiwi/doc/#ref.kiwi.images.sh
#
# The KIWI image description allows to have an optional config.sh script in place.
# This script should be designed to take over control of adding the image operating system configuration.
# Configuration in that sense means stuff like activating services,
# creating configuration files, prepare an environment for a firstboot workflow, etc.
# What you shouldn't do in config.sh is breaking your systems integrity by for example removing packages or pieces of software.
# Something like that can be done in images.sh. The config.sh script is called after the user and groups have been set up.
# If there are SUSE Linux related YaST XML information, these are validated before config.sh is called too.
# If you exit config.sh with an exit code != 0 kiwi will exit with an error too.
#
# [$kiwi_iname] The name of the image as listed in config.xml
# [$kiwi_iversion] The image version string major.minor.release
# [$kiwi_keytable] The contents of the keytable setup as done in config.xml
# [$kiwi_language] The contents of the locale setup as done in config.xml
# [$kiwi_timezone] The contents of the timezone setup as done in config.xml
# [$kiwi_delete] A list of all packages which are part of the packages section with type="delete" in config.xml
# [$kiwi_profiles] A list of profiles used to build this image
# [$kiwi_drivers] A comma separated list of the driver entries as listed in the drivers section of the config.xml.
# [$kiwi_size] The predefined size value for this image. This is not the computed size but only the optional size value of the preferences section in config.xml
# [$kiwi_compressed] The value of the compressed attribute set in the type element in config.xml
# [$kiwi_type] The basic image type. Can be a simply filesystem image type of ext2, ext3, reiserfs, squashfs, and cpio or one of the following complex image types: iso split usb vmx oem xen pxe
# --------------------------------------

#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

Echo "Configure image: [$kiwi_iname]..."

# own user folder
chown -R radic:users /home/radic

# set wallpaper
if [[ $kiwi_profiles == *kde* ]]; then
    rm /usr/share/wallpapers/Elarun/contents/images/2560x1600.png
    cp /radicos/wallpaper.png /usr/share/wallpapers/Elarun/contents/images/2560x1600.png
    chmod 777 /usr/share/wallpapers/Elarun/contents/images/2560x1600.png
fi

# copy our settings over to root user
cp -r /home/radic/.config /root
cp -r /home/radic/.kde4 /root
chown -R root:root /root

# add radic to sudoers
echo -n "radic ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

# cleanup
rm -rf /radicos/tmp

#======================================
# Call configuration code/functions
#--------------------------------------

#======================================
# Exit safely
#--------------------------------------
exit