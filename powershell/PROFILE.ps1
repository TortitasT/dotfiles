# OMP
# $THEME="$env:POSH_THEMES_PATH\bubblesextra.omp.json"
# $THEME="$env:POSH_THEMES_PATH\catppuccin_mocha.omp.json"
# $THEME="$env:POSH_THEMES_PATH\hotstick.minimal.omp.json"
$THEME = "$env:POSH_THEMES_PATH\wopian.omp.json"

oh-my-posh init pwsh --config $THEME | Invoke-Expression

function bg() { Start-Process -NoNewWindow @args }

# MODULES
Import-Module -Name Terminal-Icons

# BASH LIKE AUTOCOMPLETE https://dev.to/ofhouse/add-a-bash-like-autocomplete-to-your-powershell-4257
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# ALIAS
function artisan { php artisan @args }
Set-Alias art artisan

function gitFolder { Set-Location $HOME\Documents\Git }
Set-Alias gg gitFolder

function gitStatus { git status }
Set-Alias gs gitStatus

function gitAdd { git add --all }
Set-Alias ga gitAdd

function gitCommit { git commit -m @args }
del alias:gc -ErrorAction SilentlyContinue -Force
Set-Alias gc gitCommit

function gitPull { git pull @args }
Set-Alias gpl gitPull

function gitCheckout { git checkout @args }
Set-Alias gco gitCheckout

function qAlias { exit }
Set-Alias q qAlias
