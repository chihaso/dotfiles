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
