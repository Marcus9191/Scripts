FOLDER="3dcoin"
CONFIG_FOLDER="$HOME/.$FOLDER"

echo "addnode=206.189.72.203
addnode=206.189.41.191
addnode=165.227.197.115
addnode=167.99.87.86
addnode=159.65.201.222
addnode=159.65.148.226
addnode=165.227.38.214
addnode=159.65.167.79
addnode=159.65.90.101
addnode=128.199.218.139
addnode=174.138.3.33
addnode=159.203.167.75
addnode=138.68.102.67" >> $HOME/.$FOLDER/$COIN_NAME.conf

systemctl stop 3dcoin
sleep 5
systemctl start 3dcoin
