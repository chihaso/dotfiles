PROMPT='%F{cyan}%D %*%f %F{cyan}%n@%m:%~%f
%# '

eval "$(rbenv init -)"

export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls='ls -FG'
alias less='less -Mr'

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export CMS_HOST="localhost"
export CMS_PORT=8080

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export EDITOR=vim
eval "$(direnv hook zsh)"

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rails関連のalias
alias bex="bundle exec"
