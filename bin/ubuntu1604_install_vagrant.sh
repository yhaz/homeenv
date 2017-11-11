VERSION=2.0.1
FILE=vagrant_"$VERSION"_x86_64.deb
URL=https://releases.hashicorp.com/vagrant/$VERSION/$FILE

echo "download $URL"
wget $URL
sudo dpkg -i $FILE

#show version
vagrant -v

