#!/bin/sh
##################################################
######### Setup dotfiles on Linux/WSL2 ###########
##################################################
#
# Requirements:
#
# - dotfiles repo
#   - `cd ~ && git clone https://github.com/roodolv/dotfiles.git`
# - Python3
# - rustup
# - npm
# - homebrew(linuxbrew)
#


########## Install shell-related tools ###########
cd ~

# starship
curl -sS https://starship.rs/install.sh | sh

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# gibo
brew install gibo

# gh
sudo mkdir -p -m 755 /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y

# delta
DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo delta.tar.gz "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
tar -xvf delta.tar.gz
mv -f delta-${DELTA_VERSION}-x86_64-unknown-linux-gnu delta
sudo install delta/delta /usr/bin
rm -rf delta delta.tar.gz

# # GLIBC for delta (required)
# # version check: `strings /lib/x86_64-linux-gnu/libc.so.6 | grep GLIBC`

# sudo vi /etc/apt/sources.list
# # add 2 lines below
# # ```bash
# # for GLIBC update to 2.34+
# # deb http://th.archive.ubuntu.com/ubuntu jammy main
# # ```

# # execute these then delta may be enable
# sudo apt update
# sudo apt install libc6


########## Install Neovim-related tools ##########
cd ~

# Python modules
sudo apt install -y python3-neovim
python -m pip install -U pynvim neovim msgpack

# rustup for Rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Rust toolchain
rustup component add rust-analyzer cargo-clippy rustfmt

# Node.js packages
npm i -g -y yarn
npm i -g -y @biomejs/biome typescript-language-server typescript vscode-langservers-extracted bash-language-server
npm i -g -y @fsouza/prettierd @johnnymorganz/stylua-bin jest mocha

# Homebrew packages
brew install lua-language-server
brew install ruff

# fzf
FZF_VERSION=$(curl -s "https://api.github.com/repos/junegunn/fzf/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo fzf-linux_amd64.tar.gz "https://github.com/junegunn/fzf/releases/download/${FZF_VERSION}/fzf-${FZF_VERSION}-linux_amd64.tar.gz"
tar xf fzf-linux_amd64.tar.gz fzf
sudo install fzf /usr/bin
rm -rf fzf fzf-linux_amd64.tar.gz

# ripgrep(rg)
RG_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo ripgrep_amd64.deb "https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/ripgrep_${RG_VERSION}_amd64.deb"
sudo dpkg -i ripgrep_amd64.deb
rm -f ripgrep_amd64.deb

# fd
FD_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/fd/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo fd_amd64.deb "https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/fd_${FD_VERSION}_amd64.deb"
sudo dpkg -i fd_amd64.deb
rm -f fd_amd64.deb

# bat
BAT_VERSION=$(curl -s "https://api.github.com/repos/sharkdp/bat/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo bat_amd64.deb "https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb"
sudo dpkg -i bat_amd64.deb
rm -f bat_amd64.deb

# exa(eza)
sudo apt update
sudo apt install -y gpg

sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit lazygit.tar.gz

# Jq
sudo apt install -y jq


############# Nerdfont-patched fonts #############
cd ~
sudo apt install -y fontconfig
HACKGEN_VERSION=$(curl -s "https://api.github.com/repos/yuru7/HackGen/releases/latest" | grep -Po '"tag_name": "v?\K[^"]*')
curl -Lo HackGen_NF.zip "https://github.com/yuru7/HackGen/releases/download/v${HACKGEN_VERSION}/HackGen_NF_v${HACKGEN_VERSION}.zip"
unzip HackGen_NF.zip
mkdir -p ~/.fonts
cp HackGen_NF_v${HACKGEN_VERSION}/*.ttf ~/.fonts
fc-cache -f -v
rm -rf HackGen_NF.zip HackGen_NF_v${HACKGEN_VERSION}


################# Create symlinks ################
# method #1
# ln -si ~/dotfiles/.bashrc ~/.bashrc
# ln -si ~/dotfiles/.bash_aliases ~/.bash_aliases
# ln -si ~/dotfiles/.gitconfig ~/.gitconfig
# ln -si ~/dotfiles/.vimrc ~/.vimrc

# ln -si ~/dotfiles/.config/nvim ~/.config/nvim
# # ln -si ~/dotfiles/.config/wezterm ~/.config/wezterm
# ln -si ~/dotfiles/.config/starship.toml ~/.config/starship.toml

# method #2
source ~/dotfiles/setup/create_symlinks.sh

# The option "i" may be omitted. If so, the command would be: `ln -s`.
create_symlinks ~/dotfiles ~ "i"
create_symlinks ~/dotfiles/.config ~/.config "i"
