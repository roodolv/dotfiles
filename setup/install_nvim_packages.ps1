##################################################
########## Install Neovim related pkgs ###########
##################################################
#
# Requirements:
#
# - Python3
# - rustup
# - npm
# - Chocolatey
# - Scoop
#

$env:CLI_PATH="C:\\CLI"


########## Install Neovim-related tools ##########
cd ~
# Python modules
python -m pip install pynvim neovim msgpack ruff-lsp

# Rust toolchain
rustup component add rust-analyzer cargo-clippy rustfmt

# Node.js packages
npm i -g -y yarn
npm i -g -y @biomejs/biome typescript-language-server typescript vscode-langservers-extracted bash-language-server
npm i -g -y @fsouza/prettierd @johnnymorganz/stylua-bin jest mocha

# Chocolatey
choco install -y fzf
choco install -y rg
choco install -y fd
choco install -y bat

# Scoop
scoop bucket add main
scoop bucket add extras
scoop install main/eza 
scoop install lazygit 
scoop install lua-language-server

# jq
mkdir -p $env:CLI_PATH
cd $env:CLI_PATH
$env:JQ_VERSION=$(curl -s "https://api.github.com/repos/jqlang/jq/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo jq.exe "https://github.com/jqlang/jq/releases/download/$env:JQ_VERSION/jq-win64.exe"
cd -


############# Nerdfont-patched fonts #############
### HackGen: https://github.com/yuru7/HackGen/
# Download fonts
$env:HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo HackGen_NF.zip "https://github.com/yuru7/HackGen/releases/download/v$env:HACKGEN_VERSION/HackGen_NF_v$env:HACKGEN_VERSION.zip"
Expand-Archive -Path HackGen_NF.zip -DestinationPath .\HackGen_NF -Force

# Install fonts(*.ttf, *.otf) to Fonts(0x14) folder
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
Get-ChildItem -Path .\HackGen_NF -Recurse -Include *.ttf, *.otf | ForEach-Object {
    If (-not(Test-Path "C:\Windows\Fonts\$($_.Name)")) {
        $fonts.CopyHere($_.FullName, 0x10)
    }
}

# Remove temp files
Remove-Item -Path HackGen_NF.zip
Remove-Item -Path .\HackGen_NF -Recurse -Force

### Etc(WIP)


########### Patching your font with NF ###########
# choco install -y fontforge
# git clone https://github.com/ryanoasis/nerd-fonts.git
# cd nerd-fonts
# fontforge ./font-patcher <TARGET_FONT> --windows --complete
# cd -
