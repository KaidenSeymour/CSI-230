ipaddr=$(ip addr| grep "/24" | awk '{print $2}' | cut -b -15)

ip1=$(echo "${ipaddr}" | cut -d '.' -f 1)
ip2=$(echo "${ipaddr}" | cut -d '.' -f 2)
ip3=$(echo "${ipaddr}" | cut -d '.' -f 3)
ip4=$(echo "${ipaddr}" | cut -d '.' -f 4)

binaryip1=$(echo "obase=2;$ip1" | bc)
binaryip2=$(echo "obase=2;$ip2" | bc)
binaryip3=$(echo "obase=2;$ip3" | bc)
binaryip4=$(echo "obase=2;$ip4" | bc)

printf '%08d%08d%08d%08d\n' "${binaryip1}" "${binaryip2}" "${binaryip3}" "${binaryip4}"



