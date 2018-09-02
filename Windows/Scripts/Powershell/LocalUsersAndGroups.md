# Local Users And Groups

## Group Membership

### List all members of a local group

This returns all members of Local Administrators. All the CIM/WMI methods take forever. This works via net localgroup command

get-localgroupmembers -localgroup administrators

```
get-localgroupmembers -localgroup administrators
function get-localgroupmembers {  
    [cmdletBinding()] 
    param (
        [Parameter(Mandatory=$True)] 
        [string] $localgroup
    )  
      
    $members = net localgroup $localgroup | 
    where {$_ -AND $_ -notmatch "command completed successfully"} | 
    select -skip 4
    New-Object PSObject -Property @{
    Computername = $env:COMPUTERNAME
    Group = "$localgroup"
    Members=$members
    } | Out-Null
    $members
}
```
