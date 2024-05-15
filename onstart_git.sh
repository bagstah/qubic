env >> /etc/environment;
rm appsettings.json*
rm qli-Client-1.9.6-Linux-x64.tar.gz*
wget https://raw.githubusercontent.com/bagstah/qubic/main/appsettings.json
sed -i "s/vastai1/$CONTAINER_ID/g" appsettings.json
wget https://dl.qubic.li/downloads/qli-Client-1.9.6-Linux-x64.tar.gz
tar zxvf qli-Client-1.9.6-Linux-x64.tar.gz qli-Client
apt -y install screen vim
mkdir cpu

#NEW STUFF
myproc=`nproc`
cat appsettings.json | grep -v trainer | grep -v Thread > appsettings.GPU
cat appsettings.GPU | sed -e '5i\ \ \ \ "amountOfThreads": '"$myproc"',' > cpu/appsettings.json
#END NEW STUFF

cp qli-Client cpu
rm qli-runner*
rm cpu/qli-runner*
rm *.lock
rm cpu/*.lock

#wget https://github.com/Gddrig/Qubic_Hiveos/releases/download/0.5.0/rqiner-x86-cuda-Nvidia.0.5.0.tar.gz
#tar zxvf rqiner-x86-cuda-Nvidia.0.5.0.tar.gz
screen -S gpu -d -m ./qli-Client
screen -S cpu -d -m bash -c 'cd cpu ; ./qli-Client'
