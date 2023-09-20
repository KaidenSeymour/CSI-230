echo "Enter Binary IP (MAX 32):"
read user
dUser=$(echo "$((2#${user:0:8}))")
dUser1=$(echo "$((2#${user:8:8}))")
dUser2=$(echo "$((2#${user:16:8}))")
dUser3=$(echo "$((2#${user:24:8}))")


ip1=$(echo "${dUser}")
ip2=$(echo "${dUser1}")
ip3=$(echo "${dUser2}" )
ip4=$(echo "${dUser3}")

echo "${ip1}"."${ip2}"."${ip3}"."${ip4}"



