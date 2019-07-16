$global:var_string_a  = "yabba"
$global:var_string_b  = "dabba"
$global:var_array_a   = "array_1", "array_2", "array_3"
$global:var_hashmap_a = @("Ha", "Hb", "Hc")

$jsonObj = Get-Variable -Name var_* | Select-Object -Property Name, Value | ConvertTo-Json

$allVars = Get-Variable -Name var_* 

$array = @()
$array += $array + "test1"
$array += $array + "test2"
$array |  ConvertTo-Json

$hash = @{}
foreach ($var in $allVars) {
    $hash.add($var.Name, $var.Value)
}
$hash | ConvertTo-Json | Set-Content -path vars_to_json.json
