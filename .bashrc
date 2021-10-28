#
# ~/.bashrc
#

if [ -f /home/traveler/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
        source /home/traveler/.config/synth-shell/synth-shell-prompt.sh
fi


#If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Splash Calendar and time
#now


alias owofetch='echo -e " \n\n\n\n\n" && owofetch && echo -e "\n"'
alias ls='ls --color=auto'
alias mpv='devour mpv'
alias zathura='devour zathura '
alias cmatrix='cmatrix -bC blue -M "H E L L  Y E A H"'
alias php='php74'
alias composer='php /usr/local/bin/composer'
alias nvim='nvim -u .vimrc'
alias vim='nvim -u .vimrc'
alias vi='nvim -u .vimrc'
alias aulas='figlet Aulas; echo "__________________________"; echo -e "\n > Segunda: Laboratório de Programação e Design de Interação \n
 > Terça: Laboratório de Programação\n
 > Quarta : Sistemas Digitais 2 \n
 > Quinta : Cálculo I \n
 > Sexta : Metodologia de Pesquisa Cientifica\n"'
alias newsboat='newsboat -C ~/.newsboat/.config'
alias easypeasy='figlet Instructions; echo "________________________________________________________________"; echo -e "\n > Follow all instructions.\n
 > Keep an open mind.\n
 > Start with a feeling of elation.\n
 > Ignore all advice and influence that conflicts with EasyPeasy.\n
 > Resist any promise of a temporary fix.\n
 > Get it clear in your mind: Porn provides no genuine pleasure or crutch and you aren’t making a sacrifice. There’s nothing to give up and no reason to feel deprived.\n
 > Don’t wait to quit, do it now!\n
 > Make a decision never to watch again and never question it.\n
 > Remember there is no such thing as just one peek.\n
 > Never watch porn again.\n\n";
 figlet Affirmations; echo "____________________________________________________________________________"; echo -e "\n > I’m free from the slavery of porn.\n
 > It’s easy to ignore my thoughts about porn.\n
 > Bye bye thoughts, bye bye urges. Oh, there goes my cravings.\n
 > I focus my subconscious mind to overcome porn addiction.\n
 > Porn steals my time, energy and vitality.\n
 > Beating porn gets exponentially easier day by day and in every aspect.\n
 > I enjoy and value my porn-free, strong, happy, light and easy lifestyle.\n
 > If I look back and think about my progress, it gives me great joy and pride in myself.\n
 > Every time I see other porn users I get more motivated to see myself break that chain.\n
 > All that pent up energy is healing my body and mind. Then, I can do more productive and challenging work towards my values and goals.\n
 > My brain is getting back in correct shape, getting exercised by me not doing what I was previously doing.\n
 > Now all that pent up willpower is being utilised to handle lightweight stresses and strains of life.\n
 > Great, I’m free and no longer a slave!\n\n"'

#PS1='[\u@\h \W]\$ '
PS1="$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$([[ \$? != 0 ]] && echo \"\[\033[01;31m\]:(\[\033[01;34m\] \")\\$\[\033[00m\] "

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#alias neofetch='neofetch --'

alias config='/usr/bin/git --git-dir=/home/traveler/.cfg/ --work-tree=/home/traveler'
