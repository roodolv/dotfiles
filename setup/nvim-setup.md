# Neovim setup


## NOTICE
This document is intended to show what and how to do when installing nvim.

It's only an example.

Execute these commands **at your own risk**.


## Environment
- [Neovim](https://github.com/neovim/neovim) v0.10.0
- Python v3.10.6
- Node.js v22.2.0
    - nvm v1.1.12
    - npm v10.8.0
- Chocolatey v2.2.2
- Scoop
- homebrew(linuxbrew) v4.3.5


## Python modules

### Windows
```
python -m pip install -U pynvim neovim msgpack
```

### WSL2
```
sudo apt install -y python3-neovim
python -m pip install -U pynvim neovim msgpack
```


## Nerdfont-patched fonts

### Windows

#### Downloading patched files
- [HackGen_NF](https://github.com/yuru7/HackGen/releases)
```
# Download fonts
$env:HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo HackGen_NF.zip "https://github.com/yuru7/HackGen/releases/download/v$env:HACKGEN_VERSION/HackGen_NF_v$env:HACKGEN_VERSION.zip"
Expand-Archive -Path HackGen_NF.zip -DestinationPath .\HackGen_NF -Force

# Install fonts(*.ttf, *.otf)
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
Get-ChildItem -Path .\HackGen_NF -Recurse -Include *.ttf, *.otf | ForEach-Object {
    If (-not(Test-Path "C:\Windows\Fonts\$($_.Name)")) {
        $fonts.CopyHere($_.FullName, 0x10)
    }
}

# Remove temp files
Remove-Item -Path HackGen_NF.zip
Remove-Item -Path .\HackGen_NF -Recurse -Force
```

- etc

#### Manually patching
1. Execute these commands
    ```
    choco install -y fontforge
    git clone https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts
    fontforge ./font-patcher <TARGET_FONT> --windows --complete
    ```
2. Drag & drop the font files into the Windows System Settings > Fonts window

### WSL2
- [HackGen](https://github.com/yuru7/HackGen)
```
cd ~
sudo apt install -y fontconfig
HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo HackGen_NF.zip "https://github.com/yuru7/HackGen/releases/download/v${HACKGEN_VERSION}/HackGen_NF_v${HACKGEN_VERSION}.zip"
unzip HackGen_NF.zip
mkdir -p ~/.fonts
cp HackGen_NF_v${HACKGEN_VERSION}/*.ttf ~/.fonts
fc-cache -f -v
```


## CLI tools
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep(rg)](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [bat](https://github.com/sharkdp/bat)
- [exa(eza)](https://github.com/eza-community/eza)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [yarn](https://github.com/yarnpkg/yarn)
- [jq](https://jqlang.github.io/jq/)

### Windows

#### fzf,rg,fd,bat
```
choco install fzf rg fd bat
```

#### eza
```
scoop bucket add main
scoop install main/eza
```

#### lazygit
```
scoop bucket add extras
scoop install lazygit
```

#### yarn
It's required for markdown-preview.nvim
```
npm i -g yarn
```

#### jq
Download the binary on [the official website](https://jqlang.github.io/jq/)

or

```PowerShell
$env:CLI_PATH="C:\\CLI"
mkdir -p $env:CLI_PATH
cd $env:CLI_PATH
$env:JQ_VERSION=$(curl -s "https://api.github.com/repos/jqlang/jq/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo jq.exe "https://github.com/jqlang/jq/releases/download/$env:JQ_VERSION/jq-win64.exe"
```

### WSL2

#### fzf
```
cd ~
FZF_VERSION=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo fzf-linux_amd64.tar.gz "https://github.com/junegunn/fzf/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz"
tar xf fzf-linux_amd64.tar.gz fzf
sudo install ./fzf /usr/bin
```

#### ripgrep
```
cd ~
RG_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo ripgrep_amd64.deb "https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep_${RG_VERSION}_amd64.deb"
sudo dpkg -i ripgrep_amd64.deb
```

#### fd
```
sudo apt install -y fd-find
```
or
```
cd ~
FD_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/fd/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo fd_amd64.deb "https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_${FD_VERSION}_amd64.deb"
sudo dpkg -i fd_amd64.deb
```

#### bat
```
cd ~
BAT_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo bat_amd64.deb "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb"
sudo dpkg -i bat_amd64.deb
```

#### exa(eza)
Follow [the official instructions](https://github.com/eza-community/eza/blob/main/INSTALL.md#debian-and-ubuntu):
```
sudo apt update
sudo apt install -y gpg

sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
```

#### lazygit
[Official instruction](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu):
```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/bin
```

#### yarn
It's required for markdown-preview.nvim
```
npm i -g yarn
```

#### jq
```
sudo apt install -y jq
```


## Language-related tools
- [rust-toolchain](https://www.rust-lang.org/ja/tools/install)
- [ruff-lsp](https://github.com/astral-sh/ruff-lsp)
- [biome](https://github.com/biomejs/biome)
- [typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)
- [lua-language-server](https://github.com/LuaLS/lua-language-server)
- [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)
- [bash-language-server](https://github.com/bash-lsp/bash-language-server)
- [prettierd](https://github.com/fsouza/prettierd)
- [stylua](https://github.com/JohnnyMorganz/StyLua)
- [jest](https://github.com/jestjs/jest)
- [mocha](https://github.com/mochajs/mocha)

### Windows

#### Rust
Install rustup here: [Install Rust - Rust Programming Language](https://www.rust-lang.org/ja/tools/install)

rust-toolchain for Rust:
```
rustup component add rust-analyzer cargo-clippy rustfmt
```

#### Python
ruff-lsp for Python:
```
python -m pip install -U ruff-lsp
```

#### Lua
lua-ls for Lua(Windows):
```
scoop install lua-language-server
```

#### JS,TS,etc
npm packages:
```
npm i -g @biomejs/biome bash-language-server typescript-language-server typescript vscode-langservers-extracted @fsouza/prettierd @johnnymorganz/stylua-bin jest mocha -y
```

### WSL2

#### Rust
rustup for Rust:
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

rust-toolchain for Rust:
```
rustup component add rust-analyzer cargo-clippy rustfmt
```

#### Python
ruff-lsp for Python:
```
python -m pip install -U ruff-lsp
```
or
```
brew install ruff
```

#### Lua
lua-ls for Lua:
```
brew install lua-language-server
```

#### JS,TS,etc
npm packages:
```
npm i -g @biomejs/biome bash-language-server typescript-language-server vscode-langservers-extracted @fsouza/prettierd @johnnymorganz/stylua-bin jest mocha -y
```


## tree-sitter binary(Optional)
for nvim-treesitter

### Windows
No additional installation required

### WSL2
NOTICE: It may be obsolete so please check official instructions
```
cd ~
wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.0/tree-sitter-linux-x64.gz
gzip -dk tree-sitter-linux-x64.gz
mv tree-sitter-linux-x64 tree-sitter
sudo chmod +x tree-sitter
sudo cp tree-sitter /usr/bin/
```


## Environment variables on Windows
NOTICE: Be careful NOT to remove existing variables. Do it on your own risk.

### By commands
`ps1` script:
- cf. https://homaju.hatenablog.com/entry/2022/06/09/081803
```PowerShell
$env:HOME=$env:HOMEDRIVE + $env:HOMEPATH

# Overwrite this path
# $env:DEV_PROJ="path\to\your\proj"
# New-Item $env:DEV_PROJ -ItemType Directory

$env:XDG_CONFIG_HOME="$env:HOME\.config"
New-Item $env:XDG_CONFIG_HOME -ItemType Directory

$env:XDG_DATA_HOME="$env:\LOCALAPPDATA"
New-Item $env:XDG_DATA_HOME -ItemType Directory 

$env:XDG_CACHE_HOME="$env:TEMP\neovim"
New-Item $env:XDG_CACHE_HOME -ItemType Directory

#Set environment variables
[Environment]::SetEnvironmentVariable("HOME",$Env:HOME,"User")
# [Environment]::SetEnvironmentVariable("DEV_PROJ",$Env:DEV_PROJ,"User")
[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME",$Env:XDG_CONFIG_HOME,"User")
[Environment]::SetEnvironmentVariable("XDG_DATA_HOME",$Env:XDG_DATA_HOME,"User")
[Environment]::SetEnvironmentVariable("XDG_CACHE_HOME",$Env:XDG_CACHE_HOME,"User")
```

### Manually setup
or manually setup on GUI:

#### System Environ
- name: `PYTHON`
    - val: `path\to\python.exe`

#### User Environ
- name: `HOME`
    - val: `C:\Users\USERNAME`
- name: `DEV_PROJ`
    - val: `path\to\your\proj`
- name: `XDG_CONFIG_HOME`
    - val: `C:\Users\USERNAME\.config`
- name: `XDG_DATA_HOME`
    - val: `C:\Users\USERNAME\AppData\Local`
- name: `XDG_CACHE_HOME`
    - val: `C:\Users\USERNAME\AppData\Local\Temp\neovim`


## Create symlinks

### Windows
```PowerShell
cd ~
git clone https://github.com/roodolv/dotfiles.git

$env:HOME=$env:HOMEDRIVE + $env:HOMEPATH
$env:DOTFILES="$env:HOME\dotfiles"

cd $env:DOTFILES
.\setup\call_as_admin.ps1 .\setup\make_symlink.ps1 "-target $env:DOTFILES\.config\nvim -path $env:HOME\.config\nvim"
```

### WSL2
```bash
cd ~
git clone https://github.com/roodolv/dotfiles.git
mkdir -p ~/.config
ln -si ~/dotfiles/.config/nvim ~/.config/nvim
```
