export LC_ALL=en_US.UTF-8
export CLICOLOR=1
export P4CONFIG=~/.p4settings
export VISUAL=vim
export EDITOR="${VISUAL}"

export WORKON_HOME=~/.venvs
. /usr/local/bin/virtualenvwrapper.sh

ssh-add -K

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

export PS1="\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PATH=$PATH:~/bin

alias ll="ls -l"
alias la="ls -al"

export NVM_DIR="/Users/mmccredie/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.cargo/bin:$PATH"
