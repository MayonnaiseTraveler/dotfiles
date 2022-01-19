#
# ~/.bashrc
#

if [ -f /home/traveler/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
        source /home/traveler/.config/synth-shell/synth-shell-prompt.sh
fi


#If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

alias ls='ls --color=auto'
alias mpv='devour mpv'
alias zathura='devour zathura '
alias cmatrix='cmatrix -bC blue -M "H E L L  Y E A H"'
alias php='php74'
alias composer='php /usr/local/bin/composer'
alias nvim='nvim -u .vimrc'
alias vim='nvim -u .vimrc'
alias vi='nvim -u .vimrc'
alias findheavy='du -cha --max-depth=1 ./ | grep -E "G"'
alias newsboat='newsboat -C ~/.newsboat/.config'
alias config='/usr/bin/git --git-dir=/home/traveler/.cfg/ --work-tree=/home/traveler'
alias aulas='figlet Aulas; echo "__________________________"; echo -e "\n > Segunda: Laboratório de Programação e Design de Interação \n
 > Terça: Laboratório de Programação\n
 > Quarta : Sistemas Digitais 2 \n
 > Quinta : Cálculo I \n
 > Sexta : Metodologia de Pesquisa Cientifica\n"'


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
