

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

$timeoutInMinutes = 5
$starTime = GetDate
# Loop until the jobs are finished or timeout happens
While (Get-Job -State "Running") {
    $elapsedTime = ((Get-Date) - $startTime).TotalMinutes
    if ($elapsedTime -gt $timeoutInMinutes) {
      throw "Something went wrong. Shouldnt take as long as $timeoutInMinutes minutes."
    } else {
      # Will show us updates of whats happening on each VM
      Get-Job | Receive-Job
      Start-Sleep 1
    }
} 
# Get all the complete/failed jobs output
Get-Job | Receive-Job
# Clear the history once done
Get-Job | Remove-Job -Force
```