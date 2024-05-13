env >> /etc/environment;
rm appsettings.json*
rm qli-Client-1.9.6-Linux-x64.tar.gz*
wget https://raw.githubusercontent.com/bagstah/qubic/main/appsettings.json
sed -i "s/vastai1/$CONTAINER_ID/g" appsettings.json
wget https://dl.qubic.li/downloads/qli-Client-1.9.6-Linux-x64.tar.gz
tar zxvf qli-Client-1.9.6-Linux-x64.tar.gz qli-Client
apt -y install screen vim
#apt -y install vim
mkdir cpu
cat appsettings.json | grep -v trainer > cpu/appsettings.json
cp qli-Client cpu
rm qli-runner*
rm *.lock
wget https://github.com/Gddrig/Qubic_Hiveos/releases/download/0.5.0/rqiner-x86-cuda-Nvidia.0.5.0.tar.gz
tar zxvf rqiner-x86-cuda-Nvidia.0.5.0.tar.gz
screen -S gpu -d -m ./qli-Client
