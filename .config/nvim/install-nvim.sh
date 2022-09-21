#! /bin/sh

###################### NOTICE ######################
# This script intends to indicate what you do
# and how to do when installing nvim.
# It's only the example.
# You should NOT execute this for an installation.
####################################################

### Environment for test:
# OS: Ubuntu 20.04 (WSL2)
# Shell: bash 5.0.17


# Install Vim (with +clipboard)
sudo apt purge vim
sudo apt install -y vim-gtk

# Install Neovim (nightly build)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

# Update Python modules
sudo apt install -y python3-neovim
pip install -U pynvim neovim msgpack

# Install nerdfont-patched font
sudo apt install -y fontconfig
cd ~
wget https://github.com/yuru7/HackGen/releases/download/v2.4.0/HackGenNerd_v2.4.0.zip
unzip HackGenNerd_v2.4.0.zip
mkdir -p ~/.fonts
cp ./HackGenNerd_v2.4.0/*.ttf ~/.fonts
fc-cache -f -v

# Install fzf & jq & ripgrep
sudo apt install -y fzf
sudo apt install -y jq
cd ~
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# Install ctags(JP version) for coc-fzf
cd ~
wget https://hp.vector.co.jp/authors/VA025040/ctags/downloads/ctags-5.8j2.tar.gz
tar -xvf ctags-5.8j2.tar.gz
cd ctags-5.8j2
./configure
make
sudo make install

# Install tree-sitter binary for nvim-treesitter
cd ~
wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.0/tree-sitter-linux-x64.gz
gzip -dk tree-sitter-linux-x64.gz
mv tree-sitter-linux-x64 tree-sitter
sudo chmod +x tree-sitter
sudo cp tree-sitter /usr/bin/

# Install Node.js & the latest LTS release for nvim-treesitter
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
########## You should restart your shell here ##########
nvm install node
nvm install --lts
npm install -g neovim

# Add environment variables with editor(safety)
### add two lines below to the shell
### export PYTHON=/usr/bin/python3
### export NVIM_UNDODIR=~/.vim/undo
# vim ~/.bashrc

# Add environment variables with script(more risky)
echo export PYTHON=/usr/bin/python3 >> ~/.bashrc
echo export NVIM_UNDODIR=~/.vim/undo >> ~/.bashrc

# Copy dotfiles' settings to home dir
mkdir -p ~/.config
sudo ln -si ~/dotfiles/.config/nvim ~/.config/nvim

