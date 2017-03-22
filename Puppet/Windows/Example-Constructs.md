#Example Windows Constructs


## Exec Commands

### Unless Command
This will only run if the path is not mounted. Unless exit 0 means it exists in this case, so command not run
```
exec { 'Mount Network Z Drive if it Does Not Exist':
  provider  => powershell,
  command => '$(C:\Windows\System32\net.exe use Z: "\\san\shared-drive"'),
  unless  => 'if (test-path z:) { exit 0 }',
}
```

