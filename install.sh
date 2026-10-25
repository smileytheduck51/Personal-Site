#!/bin/sh
# ubuntu uses dash for sh, so not using bashims makes things faster

nice_for_admins=

packages="git caddy"
opt_packages="neovim tmux"

if [ "$USER" != "root" ]
then
    sudo -s
fi

apt-get update -y
apt-get upgrade -y
apt-get install $packages -y
timedatectl set-timezone America/New_York

sed -i '16i\
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
16i\
-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT
' /etc/iptables/rules.v4

mkdir /var/www
cd /var/www
git clone https://github.com/smileytheduck51/Personal-Site

rm /etc/caddy/Caddyfile
ln -s /var/www/Personal-Site/server/Caddyfile /etc/caddy/Caddyfile

# fix this install script (bc ik it's broken lol)
# test this actual install/maintenance script
#
# the actual html site dummy:
#   make everything adaptible to device width
#   put everything in center of screen
#   change colors
#   add margins
#   extra links at top
#   add obfuscated contact info
#
# analytic tools

systemctl restart caddy.service

if [ $nice_for_admins ]
then
    apt-get install $opt_packages -y

    # fixing a common tmux error
    echo "export TERM=xterm" >> ~/.bashrc
fi

