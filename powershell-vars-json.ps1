$global:var_string_a  = "yabba"
$global:var_string_b  = "dabba"
$global:var_array_a   = "array_1", "array_2", "array_3"
$global:var_hashmap_a = @("Ha", "Hb", "Hc")

$jsonObj = Get-Variable -Name var_* | Select-Object -Property Name, Value | ConvertTo-Json
$hash = @{}
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertfrom-stringdata?view=powershell-6
$hash.Add(
$hash
#foreach ($property in $jsonObj.PSObject.BaseObject) {
#    $hash[$property.Name] = $property.Value
#}

#$jsonObj = Get-Variable -Name var_* | Select-Object -Property Name, Value | ConvertTo-Json
