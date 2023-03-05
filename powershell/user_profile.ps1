# https://github.com/craftzdog/dotfiles-public   ---> all settings from this
#  install fonts Nerd (Hack)
#  Scoop - A command-line installer
# Git for Windows
# Oh My Posh - Prompt theme engine
# Terminal Icons - Folder and file icons
# PSReadLine - Cmdlets for customizing the editing environment, used for autocompletion
#
#
#
#
#
#
# Promt
Import-Module posh-git
Import-Module oh-my-posh


# Load prompt config
# oh-my-posh.exe init --shell pwsh --config  $env:POSH_THEMES_PATH\atomic.omp.json
# oh-my-posh.exe init --shell pwsh --config  .\noah.omp.json | Invoke-Expression
$omp_config = Join-Path $PSScriptRoot ".\noah.omp.json"
#$omp_config = Join-Path $PSScriptRoot "~\.oh-my-posh\themes\1_shell.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

#
# Alias  edit file $PROFILE.CurentUserCurrentHost >>> <<. $env:USERPROFILE\.config\powershell\user_profile.ps1
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Path
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
