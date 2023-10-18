Get-EventLog -List

$readLog = Read-host -Prompt "Please Select a Log:"  

Get-EventLog -LogName $readLog -Newest 3|Export-Csv -NoTypeInformation -Path "C:\Users\champuser\Desktop\rep.csv"