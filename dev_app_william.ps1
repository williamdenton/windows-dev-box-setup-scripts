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
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "SystemConfiguration.ps1";
executeScript "FileExplorerSettings.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "CommonDevTools.ps1";
executeScript "AwsTools.ps1";
executeScript "WSL.ps1";
executeScript "Browsers.ps1";

#--- Tools ---
#--- Installing VS and VS Code with Git
# See this for install args: https://chocolatey.org/packages/VisualStudio2017Community
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids
# visualstudio2017community
# visualstudio2017professional
# visualstudio2017enterprise

choco install -y sql-server-2017
choco install -y sql2016-clrtypes
choco install -y visualstudio2017professional --package-parameters="'--add Microsoft.VisualStudio.Component.Git'"


Update-SessionEnvironment #refreshing env due to Git install

choco install -y sql-server-management-studio
choco install -y visualstudio2017-workload-netweb
choco install -y dotnetcore-sdk --version 2.1.502
choco install -y gitextensions
choco install -y linqpad

choco install -y docker-desktop
choco install -y awscli
choco install -y aws-vault

choco install -y vscode-csharp
choco install -y vscode-docker


#--- reenabling critial items ---
Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula