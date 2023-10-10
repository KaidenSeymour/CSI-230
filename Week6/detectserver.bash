list=$(cat "activehosts.txt")

for i in ${list}
  do 
    scan=$(curl -m 5 -i -s "$i" | grep "200 OK")
    if ! [ -z "$scan" ]; then
        echo "$i" >> webservers.txt
    fi 
  done 
