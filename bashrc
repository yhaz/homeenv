# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

##### Git 
# Auto completion 
source ~/git-completion.bash

export PATH=~/bin:$PATH

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

##################################
# Open vswitch development helper commands  
##################################

# makecheck as short hand for "make check", the rest command line arguments 
# are passed into the testsuites
function makecheck() {
    make check TESTSUITEFLAGS=\'$@\'
}

[ -z "$TMUX" ] && export TERM=xterm-256color

export EDITOR=vim
export VIM_STYLE=user
export CSCOPE_EDITOR=vim
ulimit -c unlimited
alias ts='tmux list-session'
alias kt='killall tmux'
alias gd='git difftool'
alias cpmo='scp $DIR/datapath/linux/*.ko azhou@azhou-svr1:/tmp'
alias cdwork='cd /root/projs/mega-flow/openvswitch; setup.sh'
alias dev='cdwork; tmux-dev.sh; tmux attach -t dev'
alias ckmod='lsmod |grep openv'
alias killmod='rmmod openvswitch'
alias remod='rmmod openvswitch; insmod datapath/linux/openvswitch.ko'
alias cdprojs='cd /root/projs'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias inch='/root/projs/git/buildscripts/inch'
alias c='~/bin/compile_haproxy_by_hand.sh'
alias t='~/bin/haproxy_cmdline.sh'

#alias
alias a='alias'
alias va='vi ~/.bashrc'

# APT 
DEV_PKG_FILE=~/projs/homeenv/ubuntu/packages/devel
alias aptg='sudo apt-get install'
alias apts='sudo apt-cache search'
alias apt-devel='aptg `cat $DEV_PKG_FILE`'
alias vi-apt-devel='vim $DEV_PKG_FILE'

#sudo 
alias sv='sudo gvim'
alias reboot='sudo reboot'

# ssh home 
alias sshgr='ssh azhou@azhou-home.ssh22.net'
alias sshmv='ssh azhou@azhou-mv.ssh22.net'

#### C development
#editors 
alias vi='vim'
alias gv='gvim'
#cscope 
alias cs='cscope -R *.[ch]'

#git
alias gitovs='git clone git@github.com:openvswitch/ovs'
alias rmpatch='rm -rf 000*'
alias git-log-2014='git log --since="2014-1-1" |git shortlog -s -n'
alias gitpatch='git format-patch --color=never'
alias gitnetnext='git clone https://kernel.googlesource.com/pub/scm/linux/kernel/git/davem/net-next'

#GR home
alias vncubuntu14='xvncviewer 127.0.0.1:5902'
alias sshubuntu14='ssh azhou@ubuntu1404'

copy_to_server()
{
    copy_to=$1
    shift
    for i in $*
    do
        scp $i $copy_to
    done
}

copy_from_server()
{
    copy_from=$1
    shift
    for i in $*
    do
        scp $copy_from:$i /tmp
    done
}

#office test machines
alias wk1="ssh -X azhou@10.33.74.223"
alias wk2="ssh -X azhou@10.33.75.35"
alias stwk1="copy_to_server azhou@10.33.75.34:/tmp"
alias stwk2="copy_to_server azhou@10.33.75.35:/tmp"
alias cfwk2="copy_from_server azhou@10.33.75.35"

alias s214="ssh -X azhou@server214.nicira.eng.vmware.com"
#Group 1
alias s109="ssh -X azhou@prmh-nsx-perf-server109.eng.vmware.com"
alias s110="ssh -X azhou@prmh-nsx-perf-server110.eng.vmware.com"
alias ct109="copy_to_server azhou@prmh-nsx-perf-server109.eng.vmware.com:/tmp/"
alias ct110="copy_to_server azhou@prmh-nsx-perf-server110.eng.vmware.com:/tmp/"
alias cf109="copy_from_server azhou@prmh-nsx-perf-server109.eng.vmware.com"
alias cf110="copy_from_server azhou@prmh-nsx-perf-server110.eng.vmware.com"

#Group 2
alias s111="ssh -X azhou@prmh-nsx-perf-server111.eng.vmware.com"
alias s112="ssh -X azhou@prmh-nsx-perf-server112.eng.vmware.com"
alias s113="ssh -X azhou@prmh-nsx-perf-server113.eng.vmware.com"
alias r111="ssh -X root@prmh-nsx-perf-server111.eng.vmware.com"
alias r112="ssh -X root@prmh-nsx-perf-server112.eng.vmware.com"
alias r113="ssh -X root@prmh-nsx-perf-server113.eng.vmware.com"

#kernel make
alias km="make -j32 >/dev/null"
#kernel install
alias ki="sudo make install; sudo make modules_install; sudo reboot"

#DPDK
#export RTE_SDK=~/projs/dpdk
#export RTE_TARGET=x86_64-default-linuxapp-gcc

#UML
export UML_LINUX=/home/azhou/projs/uml/kernel/linux-3.13.0/linux
export UML_SETUP=/home/azhou/projs/homeenv/uml/setup.sh
alias startuml='$UML_LINUX init=/bin/bash rootfstype=hostfs'

export RTE_SDK=/home/azhou/projs/pktgen-DPDK/dpdk
export RTE_TARGET=x86_64-pktgen-linuxapp-gcc
