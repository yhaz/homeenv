#!/bin/bash

function link {
	from=$PWD/$1 
	to=$2
	echo "/bin/ln -s $from $to"
	/bin/ln -s $from $to
}

function backup {
	mv $1 ~/homeenv_backup	
}

function cleanup {
	rm -rf  $1 
}

function backup_install {
	to=$2
	if [ -z $2 ]; then 
		to=~/.$1
	fi
	backup $to
	link $1 $to
}

function cleanup_install {
	to=$2
	if [ -z $2 ]; then 
		to=~/.$1
	fi
	cleanup $to
	link $1 $to
}


mkdir -p ~/homenv_backup
file=bashrc
backup_install $file
file=vimrc
backup_install $file
file=gitconfig
backup_install $file
file=git-completion.bash
cleanup_install $file ~/$file
dir=bin
backup_install $dir ~/$dir
dir=vim
cleanup_install $dir
