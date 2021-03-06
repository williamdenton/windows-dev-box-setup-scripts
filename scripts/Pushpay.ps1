#--- Browsers ---
choco install -y googlechrome
choco install -y firefox

#--- Tools ---

choco install -y git.install --params "/GitAndUnixToolsOnPath /WindowsTerminal /SChannel"

Update-SessionEnvironment # refreshing env due to Git install

#--- Installing VS and VS Code with Git
# See this for install args: https://chocolatey.org/packages/VisualStudio2019Community
# https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community
# https://docs.microsoft.com/en-us/visualstudio/install/use-command-line-parameters-to-install-visual-studio#list-of-workload-ids-and-component-ids

choco install -y visualstudio2019professional
choco install -y visualstudio2019-workload-netweb
choco install -y visualstudio2019-workload-netcoretools
choco install -y visualstudio2019-workload-netcorebuildtools

choco install -y wsl2

choco install -y dotnetcore-sdk
choco install -y powershell-core
choco install -y microsoft-windows-terminal
choco install -y sql-server-management-studio
choco install -y python
choco install -y awscli
choco install -y nodejs-lts
choco install -y yarn

choco install -y vscode
choco install -y vscode-csharp
choco install -y vscode-docker

choco install -y sysinternals
choco install -y 7zip.install
choco install -y gitextensions
choco install -y kdiff3
choco install -y linqpad
choco install -y paint.net
choco install -y fiddler
choco install -y postman

# for Platform
choco install -y sql-server-2017
choco install -y sql2016-clrtypes
Install-Module -Name SqlServer -Force
choco install -y NuGet.CommandLine
choco install -y netfx-4.6.2-devpack
choco install -y netfx-4.7.2-devpack
choco install -y rabbitmq --version=3.7.7
. 'C:\Program Files\RabbitMQ Server\rabbitmq_server-3.7.7\sbin\rabbitmq-plugins' enable rabbitmq_management

choco install -y slack
