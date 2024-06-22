##################################################
########### Setup dotfiles on Windows ############
##################################################
#
# Requirements:
#
# - dotfiles repo
#   - `cd ~ && git clone https://github.com/roodolv/dotfiles.git`
# - Python3
# - rustup
# - npm
# - Chocolatey
# - Scoop
#

$env:HOME=$env:HOMEDRIVE + $env:HOMEPATH
$env:DOTFILES="$env:HOME\dotfiles"
$env:MY_DOCUMENTS=[System.Environment]::GetFolderPath("MyDocuments")
$env:PS_PROFILE="$env:MY_DOCUMENTS\PowerShell"


########## Install shell-related pkgs ############
cd $env:DOTFILES
.\setup\call_as_admin.ps1 .\setup\install_shell_packages.ps1


########## Install Neovim-related pkgs ###########
cd $env:DOTFILES
.\setup\call_as_admin.ps1 .\setup\install_nvim_packages.ps1


########### Set environment variables ############
New-Item $env:HOME -ItemType Directory

# NOTE: rewrite and uncomment here
# $env:DEV_PROJ="path\to\your\proj"
# New-Item $env:DEV_PROJ -ItemType Directory

$env:XDG_CONFIG_HOME="$env:HOME\.config"
New-Item $env:XDG_CONFIG_HOME -ItemType Directory

$env:XDG_DATA_HOME="$env:\LOCALAPPDATA"
New-Item $env:XDG_DATA_HOME -ItemType Directory 

$env:XDG_CACHE_HOME="$env:TEMP\neovim"
New-Item $env:XDG_CACHE_HOME -ItemType Directory

[Environment]::SetEnvironmentVariable("HOME",$env:HOME,"User")
# [Environment]::SetEnvironmentVariable("DEV_PROJ",$env:DEV_PROJ,"User")
[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME",$env:XDG_CONFIG_HOME,"User")
[Environment]::SetEnvironmentVariable("XDG_DATA_HOME",$env:XDG_DATA_HOME,"User")
[Environment]::SetEnvironmentVariable("XDG_CACHE_HOME",$env:XDG_CACHE_HOME,"User")


################# Create symlinks ################
cd $env:DOTFILES

.\setup\call_as_admin.ps1 .\setup\create_symlinks.ps1 "-target $env:DOTFILES\win\.bashrc -path $env:HOME\.bashrc"
.\setup\call_as_admin.ps1 .\setup\create_symlinks.ps1 "-target $env:DOTFILES\win\.bash_aliases -path $env:HOME\.bash_aliases"
.\setup\call_as_admin.ps1 .\setup\create_symlinks.ps1 "-target $env:DOTFILES\win\.gitconfig -path $env:HOME\.gitconfig"
.\setup\call_as_admin.ps1 .\setup\create_symlinks.ps1 "-target $env:DOTFILES\win\.vimrc -path $env:HOME\.vimrc"
.\setup\call_as_admin.ps1 .\setup\create_symlinks.ps1 "-target $env:DOTFILES\win\Microsoft.PowerShell_profile.ps1 -path $env:PS_PROFILE\Microsoft.PowerShell_profile.ps1"

.\setup\call_as_admin.ps1 .\setup\create_symlinks.ps1 "-target $env:DOTFILES\.config\nvim -path $env:HOME\.config\nvim"
.\setup\call_as_admin.ps1 .\setup\create_symlinks.ps1 "-target $env:DOTFILES\.config\wezterm -path $env:HOME\.config\wezterm"
.\setup\call_as_admin.ps1 .\setup\create_symlinks.ps1 "-target $env:DOTFILES\.config\starship.toml -path $env:HOME\.config\starship.toml"
