param(
[string]
$domain,
$password,
$username
)

$passwordencrypted = "$password" | ConvertTo-SecureString -asPlainText -Force
$completeuserinfo = "$domain\$username"
$credential = New-Object System.Management.Automation.PSCredential($completeuserinfo,$passwordencrypted)
$cmd = Add-Computer -DomainName $domain -Credential $credential
Write-output $cmd
