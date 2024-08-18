env >> /etc/environment;
rm appsettings.json*
rm -rf cpu
rm qli-Client-1.9.*
wget https://raw.githubusercontent.com/bagstah/qubic/main/appsettings.json
sed -i "s/vastai1/$CONTAINER_ID/g" appsettings.json
wget https://dl.qubic.li/downloads/qli-Client-1.9.7-Linux-x64.tar.gz
tar zxvf qli-Client-1.9.7-Linux-x64.tar.gz qli-Client

rm qli-runner*
rm *.lock

screen -S gpu -d -m ./qli-Client
