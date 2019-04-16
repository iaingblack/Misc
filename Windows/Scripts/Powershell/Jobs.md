

Example of a Job

```
$rgVMs = @("TEST01", "test02")
$bleh2 = "____"

# Clear any existing jobs in session (should be none, but you never know)
Get-Job | Remove-Job -Force

# Do on each VM
foreach ($vm in $rgvms) {
    $scriptblock = {
    param(
        $vm,
        $bleh2
    )
        Write-Host "Getting vm $vm and $bleh2"
        Start-Sleep 1
        Write-Host "$vm - 1"
        Start-Sleep 1
        Write-Host "$vm - 2"
    }
    Start-Job -ScriptBlock $scriptBlock -ArgumentList $vm,$bleh2
}

# Loop until the jobs are finished
While (Get-Job -State "Running") {    
    Write-Host "Running..." -v $info
    Start-Sleep 1        
} 
# Get all the complete/failed jobs output
Get-Job | Receive-Job
Get-Job | Remove-Job
```