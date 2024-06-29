$env:HOME=$env:HOMEDRIVE + $env:HOMEPATH

# New-Item $env:HOME -ItemType Directory

# NOTE: rewrite and uncomment here
# $env:DEV_PROJ="path\to\your\proj"
# # New-Item $env:DEV_PROJ -ItemType Directory

$env:RIPGREP_CONFIG_PATH="$env:HOME\.ripgreprc"

$env:XDG_CONFIG_HOME="$env:HOME\.config"
# New-Item $env:XDG_CONFIG_HOME -ItemType Directory

$env:XDG_DATA_HOME="$env:\LOCALAPPDATA"
# New-Item $env:XDG_DATA_HOME -ItemType Directory 

$env:XDG_CACHE_HOME="$env:TEMP\neovim"
# New-Item $env:XDG_CACHE_HOME -ItemType Directory

[Environment]::SetEnvironmentVariable("HOME",$env:HOME,"User")
# [Environment]::SetEnvironmentVariable("DEV_PROJ",$env:DEV_PROJ,"User")
[Environment]::SetEnvironmentVariable("RIPGREP_CONFIG_PATH",$env:RIPGREP_CONFIG_PATH,"User")
[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME",$env:XDG_CONFIG_HOME,"User")
[Environment]::SetEnvironmentVariable("XDG_DATA_HOME",$env:XDG_DATA_HOME,"User")
[Environment]::SetEnvironmentVariable("XDG_CACHE_HOME",$env:XDG_CACHE_HOME,"User")
