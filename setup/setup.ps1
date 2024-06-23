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


########## Install shell-related pkgs ############
cd $env:DOTFILES
.\setup\call_as_admin.ps1 .\setup\install_shell_packages.ps1


########## Install Neovim-related pkgs ###########
cd $env:DOTFILES
.\setup\call_as_admin.ps1 .\setup\install_nvim_packages.ps1


########### Set environment variables ############
cd $env:DOTFILES
.\setup\set_environ.ps1


################# Create symlinks ################
cd $env:DOTFILES
.\setup\call_as_admin.ps1 .\setup\create_dotfile_symlinks.ps1
