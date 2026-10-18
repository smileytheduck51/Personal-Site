#!/bin/sh
# ubuntu uses dash for sh, so not using bashims makes things faster

nice_for_admins=

packages="git caddy"
opt_packages="neovim tmux"

if [ "$USER" != "root" ]
then
    sudo -s
fi

apt-get update && apt-get upgrade -y
apt-get install $packages -y

timedatectl set-timezone America/New_York

mkdir /var/www
cd /var/www
git clone https://github.com/smileytheduck51/Personal-Site

# Caddyfile to github, move to /etc/caddy/Caddyfile upon install
# /etc/iptables/rules.v4 sed modify
#
# TO FIX
# /var/www permissions?? Is this True?
# add /resume to the site (in Caddyfile)
# caddy always auto starts/restarts
# rice systemd caddy unit file
# the actual html site dummy
#

systemctl restart caddy.service

if [ $nice_for_admins ]
then
    apt-get install $opt_packages -y

    # fixing a common tmux error
    echo "export TERM=xterm" >> ~/.bashrc
fi

