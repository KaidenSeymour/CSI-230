
get-service
clear
do {
     "Getting Services...Which would you like to see?`n"
     "      1. ALL`n
      2. RUNNING`n
      3. STOPPED`n
      4. QUIT`n"
    $userIn = read-host -prompt "(please answer with 'all', 'running', 'stopped' or 'quit')"

    if ($userIn -ilike "all"){
    Get-Service
    }
    if ($userIn -ilike "running"){
    "hi"
        Get-Service | where {$_.Status -ilike "Running"} | out-string
    }
    elseif ($userIn -ilike "stopped"){
        Get-Service | where {$_.Status -ilike "Stopped"}
    }
     elseif ($userIn -ilike "quit"){
       "goodbye..."
     }else {
     "__________________INVALID___INPUT________________"
    }
} while ($userIn -notlike "quit")