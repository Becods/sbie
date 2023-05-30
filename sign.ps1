New-Item -ItemType directory -Path certificate
Set-Content -Path certificate\certificate.txt -Value $env:PFX_BASE64
certutil -decode certificate\certificate.txt certificate\certificate.pfx
Set-Content -Path certificate\intermediate.txt -Value $env:CER_CONTENT
certutil -decode certificate\intermediate.txt certificate\intermediate.crt
Get-Date
$currentTime = Get-Date
$date = Get-Date -Year 2014 -Month 1 -Day 1
Get-Date
& 'C:/Program Files (x86)/Windows Kits/10/bin/10.0.17763.0/x86/signtool.exe' sign /fd SHA1 /p $env:PFX_PASSWORD /ac certificate\intermediate.crt /f certificate\certificate.pfx Installer/SbiePlus_x64/SbieDll.dll
Set-Date $currentTime
Remove-Item -Recurse -Force certificate
