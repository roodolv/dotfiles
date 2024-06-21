# thanks to: https://qiita.com/BlueSilverCat/items/1a70492437411e932b34
param(
  [Parameter(Mandatory = $true)][string]$target,
  [Parameter(Mandatory = $true)][string]$path,
  [Parameter()][string]$name
)

function isAdmin {
  $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
  return $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function makeSymLink {
  param(
    [Parameter(Mandatory = $true)][string]$target,
    [Parameter(Mandatory = $true)][string]$path,
    [Parameter()][string]$name
  )
  $value = isAdmin
  if (!$value) {
    Write-Host "管理者権限が必要"
    return
  }
  if ($name -eq "") {
    New-Item -ItemType SymbolicLink -Path $path  -Value $target
  }
  else {
    New-Item -ItemType SymbolicLink -Path $path  -Name $name -Value $target
  }
}

makeSymLink -target $target -path $path -name $name
