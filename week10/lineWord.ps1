$filesToCount = Get-ChildItem -Recurse -filter "*.bash"
#Get-ChildItem
$filesToCount
for ($i=0; $i -lt $filesToCount.Length; $i++){
$array = Get-Content $filesToCount[$i].FullName |  Measure-Object -Line -Word
$array
}
