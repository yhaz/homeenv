wget -q https://www.virtualbox.org/download/oracle-vbox_2016.asc -O-| sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install virtualbox-5.2
