oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\bubblesextra.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# ALIASES
function artisan { php artisan @args }
Set-Alias art artisan

function gitStatus { git status }
Set-Alias gs gitStatus

function gitAdd { git add --all }
Set-Alias ga gitAdd

function gitPull { git pull @args }
Set-Alias gpl gitPull

function gitCheckout { git checkout @args }
Set-Alias gco gitCheckout