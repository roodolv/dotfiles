$env:HOME=$env:HOMEDRIVE + $env:HOMEPATH
$env:DOTFILES="$env:HOME\dotfiles"
$env:MY_DOCUMENTS=[System.Environment]::GetFolderPath("MyDocuments")
$env:PS_PROFILE="$env:MY_DOCUMENTS\PowerShell"

cd $env:DOTFILES

.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\.bashrc" -path "$env:HOME\.bashrc"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\.bash_profile" -path "$env:HOME\.bash_profile"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\.bash_aliases" -path "$env:HOME\.bash_aliases"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\.gitconfig" -path "$env:HOME\.gitconfig"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\.wslconfig" -path "$env:HOME\.wslconfig"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\.ripgreprc" -path "$env:HOME\.ripgreprc"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\.vimrc" -path "$env:HOME\.vimrc"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\.ideavimrc" -path "$env:HOME\.ideavimrc"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\win\Microsoft.PowerShell_profile.ps1" -path "$env:PS_PROFILE\Microsoft.PowerShell_profile.ps1"

.\setup\create_symlinks.ps1 -target "$env:DOTFILES\.config\nvim" -path "$env:HOME\.config\nvim"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\.config\wezterm" -path "$env:HOME\.config\wezterm"
.\setup\create_symlinks.ps1 -target "$env:DOTFILES\.config\starship.toml" -path "$env:HOME\.config\starship.toml"

.\setup\create_symlinks.ps1 -target "$env:DOTFILES\.gitignores" -path "$env:HOME\.gitignore-boilerplates"
