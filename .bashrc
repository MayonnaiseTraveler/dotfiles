#
# ~/.bashrc
#

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias mpv='devour mpv'
alias zathura='devour zathura'
alias vim='nvim'
alias newsboat='newsboat -C ~/.newsboat/.config'
PS1='[\u@\h \W]\$ '


# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#alias neofetch='neofetch --'

alias config='/usr/bin/git --git-dir=/home/traveler/.cfg/ --work-tree=/home/traveler'
