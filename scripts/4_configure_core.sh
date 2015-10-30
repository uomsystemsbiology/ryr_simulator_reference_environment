#configure_core.sh sets up applications, compiles code and puts scripts
#in the appropriate places.  It runs after all the installation commands
#have completed

log=/vagrant/temp/install.log
echo Started configure_core.sh | tee -a $log

echo Copying login message to /etc/motd | tee -a $log
sudo cp /vagrant/temp/data/motd /etc/motd

echo Copying build info to home directory | tee -a $log
sudo cp /vagrant/temp/build_info.txt /home/sbl/build_info.txt

echo Copying shell script to home directory | tee -a $log
sudo cp /vagrant/temp/data/run_experiments.sh /home/sbl/run_experiments.sh
sudo chmod 777 /home/sbl/run_experiments.sh

echo Copying instructions to home directory | tee -a $log
sudo cp /vagrant/temp/data/RyR_Simulator_Instructions.pdf /home/sbl/RyR_Simulator_Instructions.pdf
sudo chmod 777 /home/sbl/RyR_Simulator_Instructions.pdf

echo Linking the shell script into the root folder | tee -a $log
sudo ln -sv /home/sbl/run_experiments.sh /run_experiments.sh

echo Linking the instructions into the root folder | tee -a $log
sudo ln -sv /home/sbl/RyR_Simulator_Instructions.pdf /RyR_Simulator_Instructions.pdf

echo Completed configure_core.sh | tee -a $log