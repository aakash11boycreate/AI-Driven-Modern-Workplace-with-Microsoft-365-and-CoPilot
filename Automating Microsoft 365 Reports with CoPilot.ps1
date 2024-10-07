# Sample PowerShell Script: Automating Microsoft 365 Reports

# Import required modules
Import-Module Microsoft.Graph -ErrorAction Stop

# Connect to Microsoft Graph API
$token = Get-MsalToken -ClientId $clientId -TenantId $tenantId -ClientSecret $clientSecret
Connect-MgGraph -AccessToken $token.AccessToken

# Define report parameters
$reportStartDate = (Get-Date).AddDays(-30)
$reportEndDate = Get-Date

# Function to retrieve user activity
function Get-M365ActivityReport {
    $reportData = Get-MgReportUserActivityUserDetail -Period "D30"
    return $reportData
}

# Generate report
$report = Get-M365ActivityReport

# Use CoPilot to analyze and summarize key findings (Example Integration with CoPilot)
# Placeholder for CoPilot integration logic

Write-Host "CoPilot Summary: The usage of Teams has increased by 15% in the last month."
Write-Host "Generated report and saved to: ./M365_Report.csv"

# Save report to file
$report | Export-Csv -Path "./M365_Report.csv" -NoTypeInformation
