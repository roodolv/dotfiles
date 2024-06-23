param(
  [Parameter(Mandatory = $true)][string]$target,
  [Parameter(Mandatory = $true)][string]$path,
  [Parameter()][string]$name
)

function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function createSymLink {
  param(
    [Parameter(Mandatory = $true)][string]$target,
    [Parameter(Mandatory = $true)][string]$path,
    [Parameter()][string]$name
  )
  
  if ($name -eq "") {
    New-Item -ItemType SymbolicLink -Path $path -Value $target -Force
  }
  else {
    New-Item -ItemType SymbolicLink -Path $path -Name $name -Value $target -Force
  }
}

if (-not (Test-Administrator)) {
  Start-Process pwsh -Verb RunAs -ArgumentList "-NoProfile", "-Command", "Set-Location '$PWD'; & '$PSCommandPath' -target '$target' -path '$path' -name '$name'; Exit"
}
else {
  createSymLink -target $target -path $path -name $name
}
