# PowerShell script to connect to Hust network

$url = 'https://192.168.141.1/login'
$checkurl = 'https://192.168.141.1/login'
$username = ''
$password = ''

Write-Output "Hust connect script | $(Get-Date)"

$response = Invoke-WebRequest -Uri $checkurl -UseBasicParsing -Method GET
$loggedIn = $response.Content -match "You are logged in"

if (-not $loggedIn) {
  Write-Output "Not logged in, connecting with username=$username"
    
  $body = @{
    username = $username
    password = $password
  }

  Invoke-WebRequest -Uri $url -Method POST -Body $body -UseBasicParsing | Out-Null
  Write-Output "Request sent."
}

Write-Output "Script ended."
