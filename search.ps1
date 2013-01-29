[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True,Position=1)]
		[string]$Dir,
	[Parameter(Mandatory=$True)]
		[string]$Files,
	[Parameter(Mandatory=$True)]
		[string]$pattern
)
Write-Host "(¯´•._.• Searching for ""$pattern"" in $Dir and all subdirectories; File filter: $Files •._.•´¯)"
Write-Host ""

$a = @()
Get-ChildItem $Dir\$Files -recurse | select-string -pattern $pattern | %{$a = $a + $_}

$total = 0
Foreach ($i in $a) {
	Write-Host $i
	$total+=1
}

Write-Host ""
Write-Host "(¯´•._.• Found $total results matching ""$pattern"" in $Dir; File filter: $Files •._.•´¯)"