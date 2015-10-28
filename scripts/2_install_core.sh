#install_core.sh installs packages and gets the code
#and data required for the reference environment.  Configuration
#usually happens later in configure_core.sh unless something 
#depends on it here.

log=/vagrant/temp/install.log
echo Started install_core.sh | tee -a $log

echo Installing packages | tee -a $log

	sudo apt-get -y update 
	sudo apt-get -y install r-base r-base-dev evince xorg libx11-dev libglu1-mesa-dev

echo Giving everyone all permissions to /usr/local/lib | tee -a $log
#This is a copout to get compilation working
sudo chmod -R 777 /usr/local/lib

echo Installing R packages | tee -a $log
Rscript /vagrant/temp/data/install_packages.R

echo Completed package installation | tee -a $log



echo Getting code | tee -a $log
	
	git clone https://github.com/vraj004/RyR-simulator.git ~/ryr-simulator
	echo Getting build info from git | tee -a $log
	git --git-dir ~/ryr-simulator/.git log --max-count=1 --format=format:"Last Commit: %h%nAuthor: %an%nCommit Date: %ad%n" > /vagrant/temp/build_info.txt
	echo Writing build info into build_info.txt | tee -a $log
	printf '\nEnvironment built at ' >> /vagrant/temp/build_info.txt
	date >> /vagrant/temp/build_info.txt
echo Got code | tee -a $log

echo Completed install_core.sh | tee -a $log