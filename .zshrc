# gitのブランチ名表示など
# https://bottoms-programming.com/archives/mac-terminal-to-iterm2.html#toc15
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{yellow}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

PROMPT='%F{cyan}%D %*%f %F{cyan}%n@%m:%~%f%F{yellow}$vcs_info_msg_0_%f
%# '

eval "$(/opt/homebrew/bin/rbenv init - zsh)"

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

eval "$(/opt/homebrew/bin/brew shellenv)"

# rails関連のalias
alias bex="bundle exec"

# ssh-agentをログイン時に起動する（Dockerコンテナ内でもホストのSSHキーでGitHubとの接続等できるように）
# https://okash1n.works/posts/how-to-use-git-inside-vscode-dev-container/
if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
      # Launch a new instance of the agent
      ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent`
fi
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yuta/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yuta/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yuta/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yuta/google-cloud-sdk/completion.zsh.inc'; fi

# https://zenn.dev/yukionodera/articles/how-to-fix-error-mysql2
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/
