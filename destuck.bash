FOLDER="3dcoin"
CONFIG_FOLDER="$HOME/.$FOLDER"

systemctl stop 3dcoin
sleep 5
rm -r $CONFIG_FOLDER/chainstate/
rm -r $CONFIG_FOLDER/database/
rm -r $CONFIG_FOLDER/blocks/
rm -f $HOME/.$FOLDER/banlist.dat
rm -f $HOME/.$FOLDER/mncache.dat
rm -f $HOME/.$FOLDER/mnpayments.dat
rm -f $HOME/.$FOLDER/fee_estimates.dat
rm -f $HOME/.$FOLDER/netfulfilled.dat
rm -f $HOME/.$FOLDER/governance.dat
rm -f $HOME/.$FOLDER/debug.log
rm -f $HOME/.$FOLDER/3dcoind.pid
systemctl start 3dcoin
exit
