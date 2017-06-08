# Object Snippets

## How to Modify an Object

### Add members
If we pull in some JSON, we get a native powershell object.We can add some fileds as requried and then output it again.

```
$jsonItems = get-content "MyFile.json" | ConvertFrom-Json
foreach ($item in $jsonItems) {
    $item | Add-Member -NotePropertyName NewThing -NotePropertyValue "New data to add"
}
```

### Convert to CSV and Exclude Some Members
$newObj = $newObj | Select-Object -Property * -ExcludeProperty field1, field3
$newObj | ConvertTo-CSV -NoTypeInformation | Out-File -Encoding ascii newFile.csv
