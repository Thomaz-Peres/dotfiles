Import-Module -Name Terminal-Icons;

# function Update-PowerShell {
#     # Refactor of CTT_L... kinda
#     Write-Host "Checking for updates.." -ForegroundColor Green;
#     $current_version = $PSVersionTable.PSVersion.ToString();
#     $url = "https://api.github.com/repos/PowerShell/PowerShell/releases/latest";
#     $release_info = Invoke-RestMethod -Uri $url;
#     $release_version = $release_info.tag_name.Trim('v');
#     if ($current_version -lt $release_version) {
#         Write-Host "PowerShell requires an update. Updating..." -ForegroundColor Yellow;
#         winget upgrade "Microsoft.PowerShell" --accept-source-agreements --accept-package-agreements;
#         Write-Host "PowerShell updated! Restart your shell to confirm changes.";
#     } else {
#         Write-Host "PowerShell is up to date :)" -ForegroundColor Green;
#     };
# };
# Update-PowerShell

function gs {
    git status;
};

function gcom($message) {
    git commit -m $message;
};

function gcoma($message) {
    git commit -a -m $message;
};

function gpsh() {
    git push;
};

function grb($rebase_branch) {
    git rebase origin/$rebase_branch;
};

function gdb($delete_branch) {
    git branch -D $delete_branch;
};

function gstm($message) {
    git stash -m $message;
};

function gstl() {
    git stash list;
};

function gstp($pop_stash) {
    git stash pop $pop_stash;
};

# surprised this is a valid function name
function .. {
    # This is useful as fuck
    Set-Location ..;
};

function cdev($location) {
    Set-Location "E:\Dev\${location}"
}

function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
};

function ff($filename) {
    # Rip from CTT_L
    # TODO:
    # - make it faster
    Write-Host "Searching for all instances of ${filename}..." -ForegroundColor Yellow
    Get-ChildItem -Recurse -Filter "*${filename}*" -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Output "$($_.Directory)\$($_)"
    }
};

function reload {
    . $PROFILE;
    Write-Host "reloaded!" -ForegroundColor Green
}

function fetch {
    param($style = "default")
    $cfg = "$HOME\.config\fastfetch\$style.jsonc"
    if (Test-Path $cfg) { fastfetch --config $cfg } else { fastfetch }
}

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\multiverse-neon.omp.json" | Invoke-Expression

Set-Alias -Name k -Value kubectl
Set-Alias -Name v -Value nvim
Set-Alias -Name codei -Value 'code-insiders'
Set-Alias -Name coden -Value 'code'
Set-Alias -Name g -Value 'git'

$Host.UI.RawUI.WindowTitle = "Terminal";
