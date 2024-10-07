# Sample PowerShell Script: Automating Conditional Access Policies with Intune

# Connect to Microsoft Graph for Intune Management
Connect-IntuneGraph

# Define device compliance policies
$policy = @{
    displayName = "Require Encryption for USB Devices"
    platforms = "Windows10"
    rules = @(
        @{
            type = "RequireEncryption"
            compliance = "true"
        }
    )
}

# Create device compliance policy in Intune
New-DeviceCompliancePolicy -Policy $policy

# Automate policy assignment
Assign-PolicyToUsers -PolicyId $policy.Id -UserGroupId "SecurityGroupID"

Write-Host "Compliance policy created and assigned: Require USB Encryption."
