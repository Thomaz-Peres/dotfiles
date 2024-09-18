oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\multiverse-neon.omp.json" | Invoke-Expression

Set-Alias -Name k -Value kubectl
Set-Alias -Name v -Value nvim
Set-Alias -Name code -Value 'code-insiders'

Set-Alias lvim 'C:\Users\thoma\.local\bin\lvim.ps1'

function Update-PowerShell {
    # Refactor of CTT_L... kinda
    Write-Host "Checking for updates.." -ForegroundColor Green;
    $current_version = $PSVersionTable.PSVersion.ToString();
    $url = "https://api.github.com/repos/PowerShell/PowerShell/releases/latest";
    $release_info = Invoke-RestMethod -Uri $url;
    $release_version = $release_info.tag_name.Trim('v');
    if ($current_version -lt $release_version) {
        Write-Host "PowerShell requires an update. Updating..." -ForegroundColor Yellow;
        winget upgrade "Microsoft.PowerShell" --accept-source-agreements --accept-package-agreements;
        Write-Host "PowerShell updated! Restart your shell to confirm changes.";
    } else {
        Write-Host "PowerShell is up to date :)" -ForegroundColor Green;
    };
};
Update-PowerShell

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
