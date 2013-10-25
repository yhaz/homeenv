
mkdir ~/homenv_backup
mv ~/.bashrc ~/homeenv_backup/bashrc_backup
ln -s $PWD/bashrc ~/.bashrc
mv ~/.vimrc ~/vimrc_backup
ln -s $PWD/vimrc ~/.vimrc
mv ~/.gitconfig ~/gitconfig_backup
ln -s $PWD/gitconfig ~/.gitconfig
