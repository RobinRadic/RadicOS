#!/bin/bash
# ======================================
#
# Documentation: http://doc.opensuse.org/projects/kiwi/doc/#ref.kiwi.config.sh
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

# functions..
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile
test -f /

#======================================
# Startup
#--------------------------------------
Echo "Configure image: [$kiwi_iname]..."


#======================================
# Services
#--------------------------------------
# use zypper to search for the installed product and install all product specific package
suseSetupProductInformation
# Call all postin scriptlets which among other things activates all required default services using suseInsertService
suseActivateDefaultServices
# Recursively insert a service. If there is a service required for this service it will be inserted first. The suse insserv program is used here
suseInsertService boot.device-mapper

Echo "** Running suseConfig..."
# Setup keytable language and timezone if specified in config.xml and call SuSEconfig afterwards
suseConfig

echo "** Running ldconfig..."
/sbin/ldconfig
suseImportBuildKey


#======================================
# System configuration
#--------------------------------------
Echo '** Configuring firewall...'
chkconfig SuSEfirewall2_init on
chkconfig SuSEfirewall2_setup on

sed --in-place -e 's/# solver.onlyRequires.*/solver.onlyRequires = true/' /etc/zypp/zypp.conf

# Enable sshd
chkconfig sshd on

Echo '** Update sysconfig entries...'
baseUpdateSysConfig /etc/sysconfig/keyboard KEYTABLE us.map.gz
baseUpdateSysConfig /etc/sysconfig/network/config FIREWALL yes
baseUpdateSysConfig /etc/init.d/radicos_firstboot NETWORKMANAGER no
baseUpdateSysConfig /etc/sysconfig/SuSEfirewall2 FW_SERVICES_EXT_TCP 22\ 80\ 443
baseUpdateSysConfig /etc/sysconfig/console CONSOLE_FONT lat9w-16.psfu
baseUpdateSysConfig /etc/sysconfig/displaymanager DISPLAYMANAGER kdm4
baseUpdateSysConfig /etc/sysconfig/windowmanager DEFAULT_WM kde
baseUpdateSysConfig /etc/sysconfig/displaymanager DISPLAYMANAGER kdm
baseUpdateSysConfig /etc/sysconfig/language RC_LANG en_US.UTF-8

# Set the default run level


if [[ $kiwi_profiles == *kde* ]] || [[ $kiwi_profiles == *x11* ]]; then
    # extract icons
   # dir=$PWD
  #  cd /home/radic/.kde4/share/icons
   # tar -zxvf evolvere-black-folders.tar.gz
   # cd $dir


    sh /radicos/configure_kde4_background.sh

    baseSetRunlevel 5
else
    baseSetRunlevel 3
fi

Echo '** Rehashing SSL Certificates...'
c_rehash




# sh /studio/configure_kdm4_theme.sh
# sh /studio/configure_kde4_background.sh

# umount the system filesystems /proc, /dev/pts, and /sys.
baseCleanMount

exit 0
