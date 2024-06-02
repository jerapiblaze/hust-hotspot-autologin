$url = 'https://bknet77.hust.edu.vn/login'
$checkurl = 'https://bknet77.hust.edu.vn/status'
$username = 'your_hust_username_aka_email_without_@sis_hust_edu_vn_or_@hust_edu_vn'
$password = 'your_password'

Write-Output "Hust connect script | $(Get-Date)"

$CHECK = Invoke-WebRequest -Uri $checkurl

if ($CHECK.Content -like "*Error 302*") {
  Write-Output "Not logged in, connecting with username=$username"
  Invoke-WebRequest -Uri $url -Method POST -Body "username=$username&password=$password"
  Write-Output "Request sent."
}
Write-Output "Script ended."