export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="headline"

export GPG_TTY=$(tty)

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias aliases="bat ~/.zshrc | grep 'alias '"
alias vim='nvim'
alias lg='lazygit'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NODE_OPTIONS=--max_old_space_size=4096

gch() {
    git checkout $(git branch | fzf | tr -d "[[:space:]]")
}

if [ -e ~/.datavant.zshrc ]; then
    source ~/.datavant.zshrc
fi

eval "$(direnv hook zsh)"

export PATH=$HOME/.dotnet/tools:$PATH
