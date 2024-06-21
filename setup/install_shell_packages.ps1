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
