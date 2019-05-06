# Pretty bash colors
export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced
# export PS1="\u@\h:\W$ "
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# File commands
alias ll="ls -allh"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Peaceful co-existance of anaconda and brew

if [ -z "$ORIGINAL_PATH" ]
then
  export ORIGINAL_PATH="$PATH"
else
  export PATH="$ORIGINAL_PATH"
fi

export CONDA_PATH="xyz:$PATH"
export PATH="$CONDA_PATH"
PATH=$PATH:/usr/local/sbin

alias decondafy='export PATH="$ORIGINAL_PATH" && echo Decondafied...'
alias recondafy='export PATH="$CONDA_PATH" && echo Recondafied...'

brew () {
  decondafy
  command brew "$@"
  recondafy
}

