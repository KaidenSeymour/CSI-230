function listIps ()
{
  output=$(cat /var/log/apache2/access.log | grep '200') 
  echo "$output" >> "/home/kaiden/CSI-230/Week6/clientIPs.txt"
}

#listIps
function getVisitors ()
{
 output=$(cat /var/log/apache2/access.log | grep $(date +"%d/%b/%Y") | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort | uniq -c)
  echo "$output"
}
#getVisitors
function badClients ()
{
  output=$(cat /var/log/apache2/access.log | grep -E "[40]{1}[0-4]{1}" | grep $(date +"%d/%b/%Y:%H")) # | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort | uniq -c)
  list=$(echo "$output" | cut -d ' ' -f1)
  declare -A count
  for i in $list 
    do
      #echo "$i"
      let count[$i]++
    done
  for i in "${!count[@]}"
    do
  if [ "${count[$i]}" -gt "2" ]; then
	echo "$i" > "badClients.txt"  
  fi
  done 
}
#badClients 
function histogram ()
{
output=$(cat /var/log/apache2/access.log | grep '200' | grep $(date +"%d/%b/%Y") | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort | uniq -c)
echo "$output"
}
#histogram
function block ()
{
  blockip=$(cat "badClients.txt") #| grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort | uniq -c)
  for i in $blockip
  do 
    iptables -A INPUT -s "$i" -j DROP
    echo "IP address: " "$i" "blocked"
    echo "$i" >> "blockedips.txt"
  done 
echo "$blockip"
}
#block
function unblock ()
{
  unblockip=$(cat "badClients.txt") 
  for i in $unblockip 
  do 
    iptables -D INPUT -s "$i" -j DROP
    echo "IP address: " "$i" "unblocked"
    echo "$i" >> "blockedips.txt"
  done 
echo "$unblockip"
}

echo "Hello User. Please Select an option"
echo "1.List IPs"
echo "2.Get Network Visitors"
echo "3.Get Bad Clients"
echo "4.Show Histogram"
echo "5.Block Bad Clients "
echo "6.Unblock Bad Clients"
echo "7.Exit"


read user
while [ "${user}" != "7" ]
do
  if [[ "${user}" == "1" ]] 
        then listIps
  elif [[ "${user}" == "2" ]]
       then getVisitors
  elif [[ "${user}" == "3" ]]
        then badClients
  elif [[ "${user}" == "4" ]]
        then histogram
  elif [[ "${user}" == "5" ]]
        then block
  elif [[ "${user}" == "6" ]]
        then unblock
  elif [[ "${user}" -gt "7" ]]
        then echo "Please enter a valid input (1-7)" 
        fi
echo "Please Select an option"
echo "1.List IPs"
echo "2.Get Network Visitors"
echo "3.Get Bad Clients"
echo "4.Show Histogram"
echo "5.Block Bad Clients "
echo "6.Unblock Bad Clients"
echo "7.Exit"

read user

done



