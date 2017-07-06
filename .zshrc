ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git

if [ "$OSTYPE"="darwin11.0" ]; then
  antigen bundle osx
fi

#antigen bundle vagrant
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle $ZSHA_BASE/bundles/stv


antigen theme https://github.com/Lessthan0tom/zsh-stuff themes/tomclark-edited-prose

antigen apply

# xdg-open in new subprocess
function open () {
    xdg-open "$*" &
}



# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# linux clipboard aliases


alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'


#Android Dev stuff

export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#nvm use stable > /dev/null
nvm use --lts > /dev/null