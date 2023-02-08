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
alias todo='vim ~/Notes/Quick/todo.md'
alias today='vim ~/Notes/Daily/$(date +%Y-%m-%d.md)'
alias yesterday='vim ~/Notes/Daily/$(date -v-1d +%Y-%m-%d.md)'
alias lg='lazygit'
alias smartpull-leeloo="(cd ~/Projects/localization && node pull.js --project WebApp --repository ~/Projects/extension-monorepo/packages/leeloo --resource WebApp.json)"
alias smartpull-extension="node pull.js --project Extension --repository ~/Projects/extension-monorepo/packages/webextension --resource ExtensionV2.json"
alias smartadd-leeloo="(cd ~/Projects/localization && node update.js --project WebApp --repository ~/Projects/extension-monorepo/packages/leeloo --resource WebApp.json --preserveLocalTranslations)"
alias smartadd-extension="node update.js --project Extension --repository ~/Projects/extension-monorepo/packages/webextension --resource ExtensionV2.json --preserveLocalTranslations"
alias smartupdate-leeloo="(cd ~/Projects/localization && node update.js --project WebApp --repository ~/Projects/extension-monorepo/packages/leeloo --resource WebApp.json)"
alias smartupdate-extension="node update.js --project Extension --repository ~/Projects/extension-monorepo/packages/webextension --resource ExtensionV2.json"
alias smartforce-leeloo="node update.js --project WebApp --repository ~/Projects/extension-monorepo/packages/leeloo --resource WebApp.json --forceUploadTranslations"
alias smartforce-extension="node update.js --project Extension --repository ~/Projects/extension-monorepo/packages/webextension --resource ExtensionV2.json --forceUploadTranslations"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
