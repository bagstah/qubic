env >> /etc/environment;

apt -y install screen vim
sleep 10
myproc=`expr \`nproc\` - 2`

wget https://github.com/nanopool/nanominer/releases/download/v3.9.2/nanominer-linux-3.9.2.tar.gz
tar zxvf nanominer-linux-3.9.2.tar.gz nanominer
chmod +x nanominer
screen -S gpu -d -m ./nanominer -algo Evrprogpow -wallet EPNfS782KjhfGeY162ezHiYff3my2CHCuf -pool1 us.evrpool.org:1111
