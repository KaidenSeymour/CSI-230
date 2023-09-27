input="/home/kaiden/CSI-230/week4/ipcounter.txt"
while IFS= read -r line; do 

dUser=$(echo "$((2#${line:0:8}))")
dUser1=$(echo "$((2#${line:8:8}))")
dUser2=$(echo "$((2#${line:16:8}))")
dUser3=$(echo "$((2#${line:24:8}))")


ip1=$(echo "${dUser}")
ip2=$(echo "${dUser1}")
ip3=$(echo "${dUser2}" )
ip4=$(echo "${dUser3}" )
printf "$ip1"."$ip2"."$ip3"."$ip4\n" >> possibleips.txt
done < "$input"
 
