# The script install .NET Framework 3.5 on Windows Server
# Based on Windows Server default security policy, installation from distributive is not available
# This Powershell cmdlet should be used instead

Install-WindowsFeature -Name NET-Framework-Features -Restart