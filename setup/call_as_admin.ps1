# thanks to: https://qiita.com/BlueSilverCat/items/1a70492437411e932b34
param(
  [Parameter(Mandatory = $true)][string]$script,
  [Parameter()][string]$args
)
Start-Process pwsh -ArgumentList "-NoExit", $script, $args -Verb RunAs -Wait
