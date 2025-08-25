##################################################
########### Install shell related pkgs ###########
##################################################
#
# Requirements:
#
# - Chocolatey
# - Scoop
#
##################################################

# git-completion
curl.exe -o $HOME\.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# Chocolatey
choco install -y starship
choco install -y zoxide
choco install -y gh
choco install -y gibo

# clink for cmd
scoop bucket add main
scoop install clink
clink autorun install

# NOTE: 
# execute `RefreshEnv.cmd` on cmd(Command Prompt)
# and you may need this as well: https://github.com/shunsambongi/clink-zoxide/
