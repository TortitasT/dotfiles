# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dst" # set by `omz`

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# //////////////////////////////////////////////////////////////////////////////////////////////////////
# // USER CONFIG ///////////////////////////////////////////////////////////////////////////////////////
# //////////////////////////////////////////////////////////////////////////////////////////////////////

# You may need to manually set your language environment
export LANG=es_ES.UTF-8

# Preferred editor
export EDITOR="nvim"

# Compilation flags
if [[ "$OSTYPE" == "darwin"* ]]; then
  export ARCHFLAGS="-arch arm64"
else
  export ARCHFLAGS="-arch x86_64"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FreeBSD $HOME/.local/bin path is not in $PATH by default ($HOME/bin is)
if [[ "$OSTYPE" == "freebsd"* ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

# // ALIAS ////////////////////////////////
#
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Misc
alias cls="clear"
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"
alias l="ls -l"
alias x="startx"
alias q="exit"
alias :q="exit"
alias .q="exit"
if [[ "$OSTYPE" == "freebsd"* ]]; then alias poweroff="doas poweroff"; fi
# Git
alias g="git"
if [[ "$OSTYPE" == "darwin"* ]]; then alias gg="cd ~/Documents/Git"; fi
if [[ "$OSTYPE" == "freebsd"* ]]; then alias gg="cd ~/Git"; fi
alias gl="git log --graph --oneline --decorate --all"
alias gs="git status"
alias ga="git add --all"
alias gc="git commit -m"
alias gco="git checkout"
# Laravel
alias art="php artisan"
alias artest="vendor/bin/phpunit --testdox"
# Python
alias py="python3"
alias pip="pip3"
#
# // ALIAS END ////////////////////////////


# // MAIN ////////////////////////////
#
if [[ "$OSTYPE" == "freebsd"* ]]; then
  eval `ssh-agent`
  neofetch
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Load autosuggestions
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

  # LaTeX
  export PATH="/Library/TeX/texbin/:$PATH"

  # Deno bin
  export PATH="$HOME/.deno/bin:$PATH"

  # Node default version
  nvm use 16

  # Git identity manager
  export PATH="$HOME/bin/git-idm:$PATH"

  # iTerm2 integration
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

  # Bash completion nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  # Bun completions
  [ -s "/Users/vgf/.bun/_bun" ] && source "/Users/vgf/.bun/_bun"

  # Bun
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"

  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
#
# // MAIN END ////////////////////////////
