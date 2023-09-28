# Reference: https://learn.microsoft.com/en-us/windows/package-manager/winget/
# $progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -OutFile $env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://github.com/microsoft/winget-cli/releases/download/v1.5.2201/e9f07317387242099dd02cb57aa04c37_License1.xml -OutFile $env:TEMP\License.xml
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile $env:TEMP\Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.7.3/Microsoft.UI.Xaml.2.7.x64.appx -OutFile $env:TEMP\Microsoft.UI.Xaml.2.7.x64.appx
Add-AppxPackage $env:TEMP\Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage $env:TEMP\Microsoft.UI.Xaml.2.7.x64.appx
Add-AppxPackage $env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Add-AppxProvisionedPackage -Online -PackagePath $env:TEMP\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle -LicensePath $env:TEMP\License.xml

# $progressPreference = 'silentlyContinue'
# Write-Information "Downloading WinGet and its dependencies..."
# Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
# Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
# Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.7.3/Microsoft.UI.Xaml.2.7.x64.appx -OutFile Microsoft.UI.Xaml.2.7.x64.appx
# Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
# Add-AppxPackage Microsoft.UI.Xaml.2.7.x64.appx
# Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
