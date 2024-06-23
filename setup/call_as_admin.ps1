param(
  [Parameter(Mandatory = $true)][string]$script,
  [Parameter()][string]$args
)
Start-Process pwsh -ArgumentList "-NoProfile", "-Command", "Set-Location '$PWD'; & '$script' $args; Exit" -Verb RunAs -Wait
