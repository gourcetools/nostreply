chmod -R +x ./*.sh
chmod -R +x ./src/scripts/*/*.sh
cd src/scripts/install
./install.sh

cd src/scripts/setup
./setup.sh

cd ../../../
