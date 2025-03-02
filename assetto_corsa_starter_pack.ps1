# Function to check if the script is running as Administrator
function Check-IfAdmin {
    $currentIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $currentPrincipal = New-Object System.Security.Principal.WindowsPrincipal($currentIdentity)
    return $currentPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

# If not run as Administrator, relaunch the script with elevated privileges
if (-NOT (Check-IfAdmin)) {
    Start-Process powershell -ArgumentList "-NoExit", "-Command", $myinvocation.MyCommand.Definition -Verb RunAs
    exit
}

# Check if Assetto Corsa is installed by verifying the directory in the default Steam folder
$assettoPath = "C:\Program Files (x86)\Steam\steamapps\common\assettocorsa"  # Adjust this if Assetto Corsa is installed elsewhere
if (-Not (Test-Path $assettoPath)) {
    Write-Host "Assetto Corsa is not found in the specified directory. Please make sure it's installed." -ForegroundColor Red
    exit
}

do {
    Write-Host "Select an option:" -ForegroundColor Cyan
    Write-Host "1. Download Content Manager"
    Write-Host "2. Download No Hesi Tracks and Car Pack"
    Write-Host "3. Download Sol and Pure"
    Write-Host "4. Download Reshade"
    Write-Host "5. Download MartysMods Shaders"
    Write-Host "6. Download Rain FX"
    Write-Host "7. Join Sol | Pure Discord Server"
    Write-Host "8. Join No Hesi Discord Server"
    Write-Host "9. Join PGhub Discord Server"
    Write-Host "10. Join Reshade Discord Server"
    Write-Host "11. Join the server the creator is featured in, Bloxshade"  # Updated text here
    Write-Host "12. Exit"

    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        "1" {
            Write-Host "Downloading Content Manager..."
            Start-Process "https://acstuff.ru/app/"
            Write-Host "Be sure to download the Custom Shaders Patch!"
        }
        "2" {
            Write-Host "Downloading No Hesi Tracks and Car Pack..."
            Start-Process "https://shutokorevivalproject.com"
            Start-Process "https://cdn.nohesi.gg/cars/"
        }
        "3" {
            Write-Host "You have two options for Sol and Pure:"
            Write-Host "1. **Pure** - Higher quality, more features, but paid version."
            Write-Host "2. **Sol** - Slightly lower quality but free."
            $solPureChoice = Read-Host "Would you like to pay for better quality? (Enter 1 for Pure, 2 for Sol)"

            if ($solPureChoice -eq "1") {
                Write-Host "Downloading Pure..."
                Start-Process "https://www.patreon.com/c/peterboese/posts"
            } elseif ($solPureChoice -eq "2") {
                Write-Host "Downloading Sol..."
                Start-Process "https://www.overtake.gg/downloads/sol.24914/"
            } else {
                Write-Host "Invalid option, returning to menu." -ForegroundColor Red
            }
        }
        "4" {
            Write-Host "Downloading Reshade..."
            Start-Process "https://reshade.me"
        }
        "5" {
            Write-Host "Downloading MartysMods Shaders..."
            Write-Host "You need Reshade for this!"
            Start-Process "https://www.patreon.com/c/mcflypg/posts?utm_source=website&utm_medium=fpbutton"
        }
        "6" {
            Write-Host "Downloading Rain FX..."
            Start-Process "https://www.patreon.com/c/x4fab/posts"
        }
        "7" {
            Write-Host "Joining Sol | Pure Discord Server..."
            Start-Process "https://discord.gg/TqChgAwYTX"
        }
        "8" {
            Write-Host "Joining No Hesi Discord Server..."
            Start-Process "https://discord.com/invite/nohesitation"
        }
        "9" {
            Write-Host "Joining PGhub Discord Server..."
            Start-Process "https://discord.gg/BpqnGDnjsp"
        }
        "10" {
            Write-Host "Joining Reshade Discord Server..."
            Start-Process "https://discord.com/invite/PrwndfH"
        }
        "11" {
            Write-Host "Joining the server the creator is featured in, Bloxshade..."  # Updated text here
            Start-Process "https://discord.gg/NDMQMTQvw8"
        }
        "12" {
            # Countdown timer for closing the window
            Write-Host "Don't forget to install your own cars and tracks!" -ForegroundColor Green
            For ($i = 5; $i -gt 0; $i--) {
                Write-Host "$i seconds remaining..." -ForegroundColor Yellow
                Start-Sleep -Seconds 1
            }
            Write-Host "Closing..." -ForegroundColor Red
            Start-Sleep -Seconds 1

            # Now explicitly kill the PowerShell process running the script
            Stop-Process -Id $PID
        }
        default { 
            Write-Host "Invalid option. Please try again." -ForegroundColor Red
        }
    }

    $continueChoice = Read-Host "Would you like to choose again? (Y/N)"
} while ($continueChoice -eq 'Y' -or $continueChoice -eq 'y')

Write-Host "Don't forget to install your own cars and tracks!" -ForegroundColor Green
For ($i = 5; $i -gt 0; $i--) {
    Write-Host "$i seconds remaining..." -ForegroundColor Yellow
    Start-Sleep -Seconds 1
}
Write-Host "Closing..." -ForegroundColor Red
Start-Sleep -Seconds 1

# Explicitly kill the PowerShell process after countdown
Stop-Process -Id $PID
