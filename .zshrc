ZSHA_BASE=$HOME/.zsh-antigen
source $ZSHA_BASE/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git

if [ "$OSTYPE"="darwin11.0" ]; then
  antigen bundle macos
fi

#antigen bundle vagrant
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle $ZSHA_BASE/bundles/stv


antigen theme https://github.com/Lessthan0tom/zsh-stuff themes/tomclark-edited-prose

antigen apply

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Random user bins
export PATH=${PATH}:${HOME}/bin:${HOME}/.local/bin


# linux clipboard aliases

alias k='kubectl'

# Android Dev stuff

export ANDROID_HOME=${HOME}/Android/Sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Docker stuff

export PATH=/usr/bin:$PATH

# If WSL
if [[ $(uname -r) =~ WSL ]]; then
  alias cmd="cmd.exe"
  alias open="explorer.exe"

  alias subl="subl.exe"
  alias nmap="nmap.exe"
  alias adb="adb.exe"
  alias scrcpy="scrcpy.exe"
  alias arp="arp.exe"

  alias setclip="clip.exe"
  alias getclip="powershell.exe /c Get-Clipboard"

  # As per:
  # https://github.com/MicrosoftDocs/terminal/blob/dev/migrie/duplicate-path/TerminalDocs/tutorials/new-tab-same-directory.md
  PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"'
  precmd() { eval "$PROMPT_COMMAND" }
# If Mac OS
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # open already a thing in Mac OS

# If regular Linux
else
  function open () {
    # xdg-open in new subprocess
    xdg-open "$*" &
  }

  alias setclip='xclip -selection c'
  alias getclip='xclip -selection clipboard -o'

  export DOCKER_HOST=unix:///run/user/1000/docker.sock
fi

PROMPT_COMMAND=${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}'printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
