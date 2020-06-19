# Description: Boxstarter Script
# Author: William Denton
# Setup dev machine for my typical requirements

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
    Invoke-WebRequest -Uri "$helperUri/$script" -UseBasicParsing | Invoke-Expression
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "CommonDevTools.ps1";
executeScript "Browsers.ps1";

$usingBootcamp = $true; # $false when installing in a VM
if ($usingBootcamp) {
    choco install -y docker-desktop
}

Update-SessionEnvironment # refreshing env due to Git install

#--- Tools ---

#--- Installing VS and VS Code with Git
# See this for install args: https://chocolatey.org/packages/VisualStudio2019Community
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids

choco install -y visualstudio2019professional
choco install -y visualstudio2019-workload-netweb
choco install -y visualstudio2019-workload-netcoretools
choco install -y visualstudio2019-workload-netcorebuildtools

#choco install -y wsl2 # not working, still pre-release

choco install -y dotnetcore-sdk
choco install -y powershell-core
choco install -y microsoft-windows-terminal
choco install -y sql-server-management-studio
choco install -y awscli
choco install -y nodejs-lts
choco install -y yarn

choco install -y vscode-csharp
choco install -y vscode-docker

choco install -y gitextensions
choco install -y kdiff3
choco install -y linqpad
choco install -y paint.net
choco install -y fiddler

# for Platform
choco install -y sql-server-2017
choco install -y sql2016-clrtypes
Install-Module -Name SqlServer -Force
choco install -y netfx-4.7.2-devpack
choco install -y dotnet3.5 # required for smtp4dev
choco install -y smtp4dev
choco install -y rabbitmq --version=3.7.7
. 'C:\Program Files\RabbitMQ Server\rabbitmq_server-3.7.7\sbin\rabbitmq-plugins' enable rabbitmq_management

#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
