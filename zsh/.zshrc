# ZSH Home
export ZSH="$HOME/.zsh"

# Environment
source $ZSH/env.sh 2>/dev/null

# History config
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

# ZSH plugins
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-completions/zsh-completions.plugin.zsh

# ZSH theme
source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme

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

# // THEME ////////////////////////////////

# Spaceship theme
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  dotnet        # .NET section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

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
alias doo="chmod 700 ./do.sh && ./do.sh"
if [[ "$OSTYPE" == "freebsd"* ]]; then alias ii="nohup pcmanfm > /dev/null 2>&1&"; fi
alias gitzip="git archive HEAD -o " # gitzip <filename>.zip to create a zip file using gitignore
alias ed="nvim"
alias emacs="emacs -nw"
# Git
alias g="git"
if [[ "$OSTYPE" == "darwin"* ]]; then alias gg="cd ~/Documents/Git"; fi
if [[ "$OSTYPE" == "freebsd"* ]]; then alias gg="cd ~/Git"; fi
if [[ "$OSTYPE" == "linux-android"* ]]; then alias gg="cd ~/Git"; fi
if [[ "$OSTYPE" == "linux-gnu"* ]]; then alias gg="cd ~/Git"; fi
alias gl="git log --graph --oneline --decorate --all"
alias gs="git status"
alias ga="git add --all"
alias gc="git commit -m"
alias gco="git checkout"
alias gb="git branch --sort=-committerdate"
# Laravel
alias art="php artisan"
alias artest="vendor/bin/phpunit --testdox"
# Python
alias py="python3"
alias pip="pip3"
# Java
alias gradlew="./gradlew"
#
# // ALIAS END ////////////////////////////


# // MAIN ////////////////////////////
#
if [[ "$OSTYPE" == "freebsd"* ]]; then
  eval `ssh-agent`
  neofetch
fi

if [[ "$OSTYPE" == "linux-android"* ]]; then
  eval `ssh-agent`
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  neofetch
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Load autosuggestions
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

  # LaTeX
  export PATH="/Library/TeX/texbin/:$PATH"

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

  # User bin directory
  export PATH="$HOME/bin:$PATH"
  export PATH="$HOME/.local/bin:$PATH"

  # Emacs keymap for zsh, needs to be set because editor is nvim
  bindkey -A emacs main

  # Funny voice when starting the terminal in macos
  (&>/dev/null say $(curl -s https://whatthecommit.com/index.txt) &)

  #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

# Deno bin
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

#
# // MAIN END ////////////////////////////
