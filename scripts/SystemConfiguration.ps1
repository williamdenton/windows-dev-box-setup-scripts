

#--- Enable developer mode on the system ---
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-PackageProvider -Name NuGet -Force
