param(
        [Parameter(Mandatory=$true)]
        [string]$FileToSign
    )

Set-StrictMode -Version 'Latest'
$PSDefaultParameterValues['*:ErrorAction'] = 'Stop'
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true

Install-Module -Name TrustedSigning -Force -Scope CurrentUser -AllowClobber

$ExistingSignature = Get-AuthenticodeSignature -FilePath $FileToSign

if ($ExistingSignature.Status -eq [System.Management.Automation.SignatureStatus]::Valid)
{
    Write-Host "File $FileToSign is already signed and valid."
}
else
{
    Write-Host "Signing file $FileToSign..."
    Invoke-TrustedSigning -Endpoint $env:AZURE_SIGNING_ENDPOINT -CodeSigningAccountName $env:AZURE_SIGNING_ACCOUNT_NAME -CertificateProfileName $env:AZURE_SIGNING_PROFILE_NAME -FileDigest SHA256 -Files $FileToSign -Verbose -TimestampRfc3161 "http://timestamp.acs.microsoft.com" -TimestampDigest SHA256
}
