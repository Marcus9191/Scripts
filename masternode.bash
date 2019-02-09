#!/bin/bash

if test "$#" -lt 2;
  then
    echo "Usage: "$0" username password"
    exit 1
fi

echo -n "[$(date +"%T")] Installing updates... "
yes | apt update > /dev/null 2>&1
apt-get install nano > /dev/null 2>&1
echo "Installed."

IFS=_ read -a tmp <<< $(uname -n)
user=$1"_"${tmp[2]}
echo -n "["$(date +"%T")"] Adding user "$user"... "
useradd $user
echo "Added"

echo -n "[$(date +"%T")] Changing password... "
echo $user:$2 | chpasswd
echo "Changed."

echo -n "[$(date +"%T")] Disabling root login... "
sed -i '/^PermitRootLogin[ \t]\+\w\+$/{ s//PermitRootLogin no/g; }' /etc/ssh/sshd_config
service ssh restart
echo "Disabled"

echo -n "[$(date +"%T")] Installing fail2ban... "
yes | apt-get install fail2ban > /dev/null 2>&1
echo "Installed"

echo -n "[$(date +"%T")] Configuring fail2ban... "
cat <<EOT >> /etc/fail2ban/jail.local
[sshd]
logpath = %(sshd_log)s
enabled = true

findtime = 604800
bantime  = 604800
maxretry = 3
EOT
service fail2ban restart
echo "Configured"

wget https://raw.githubusercontent.com/ScaMar/3dcoin-masternode-unofficial/master/masternode_setup.sh > /dev/null 2>&1
yes | /bin/bash masternode_setup.sh
