#
# ~/.bashrc
#

if [ -f /home/traveler/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
        source /home/traveler/.config/synth-shell/synth-shell-prompt.sh
fi


set -o vi

#If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && /usr/share/bash-completion/bash_completion


#Python version manager
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

alias ncmpcppi='~/.config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'
alias music='ncmpcppi'
alias pytop='bpytop'
alias ls='ls --color=auto'
alias la='ls --color=auto -alh'
alias ll='ls --color=auto -lh'
alias mpv='devour mpv'
alias zathura='devour zathura '
alias cmatrix='cmatrix -bC blue -M "H E L L  Y E A H"'
alias vim='lvim'
alias rm='trash'
alias pinfo='paru -Q --info'
alias mirror='xrandr --output HDMI-0 --output DP-1 --same-as HDMI-0'
alias findheavy='du -cha --max-depth=1 . | grep -E "G"'
alias newsboat='newsboat -C ~/.newsboat/.config'
alias config='/usr/bin/git --git-dir=/home/traveler/.cfg/ --work-tree=/home/traveler'

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
export PATH="$PATH:/home/traveler/.local/share/gem/ruby/3.0.0/bin/"


_trap_exit() { tmux kill-session -t $$; }
