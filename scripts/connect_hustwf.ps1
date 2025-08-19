# PowerShell script to connect to Hust network

$url = 'https://192.168.141.1/login'
$checkurl = 'https://192.168.141.1/login'
$username = ''
$password = ''
$attempts = 10

Write-Output "Hust connect script | $(Get-Date)"

while ((Invoke-WebRequest -Uri $checkurl -SkipCertificateCheck -UseBasicParsing).Content -notmatch "You are logged in") {
  Write-Output "Not logged in, connecting with username=$username"  
  $body = "username=$username&password=$password"
  Invoke-WebRequest -Uri $url -Method Post -Body $body -SkipCertificateCheck
  Write-Output "Request sent (remaining attempts: $attempts), expecting an Internet connection..."
  Start-Sleep -Seconds 5
  $attempts--
  if ($attempts -le 0) {
    break
  }
}

Write-Output "Script ended."
