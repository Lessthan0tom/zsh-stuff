ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git

if [ "$OSTYPE"="darwin11.0" ]; then
  antigen bundle osx
fi

antigen bundle vagrant
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle $ZSHA_BASE/bundles/stv

antigen theme $ZSHA_BASE/themes/tomclark-edited-prose

antigen apply


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'