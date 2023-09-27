
while IFS= read -r line; do


exist=$( ping -c 1 "$line" | grep "64 bytes from") 

if [ ! -z "${exist}" ]; then 

echo "$exist" | cut -d " " -f4 | tr -d ':' >> "/home/kaiden/CSI-230/week4/activehosts.txt"
fi

done < "/home/kaiden/CSI-230/week4/possibleips.txt"
