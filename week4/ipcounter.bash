echo "IP Address?:"
read ip
echo "Prefix? (16/24): "
read prefix
printf "" > ipcounter.txt
        net1=$(echo "$ip"| cut -d "." -f1)
        net2=$(echo "$ip"| cut -d "." -f2)
        net3=$(echo "$ip"| cut -d "." -f3)

	binarynet1=$(echo "obase=2;$net1" | bc)
	binarynet2=$(echo "obase=2;$net2" | bc)
	binarynet3=$(echo "obase=2;$net3" | bc)


if [[ "${prefix}" -eq "24" ]] 
	then
	 host=$(echo "$ip"| cut -d "." -f4)
	for (( i=1; i<=254; i++)); do
		host=$((i))
	binarynet4=$(echo "obase=2;$i" | bc)
		printf '%08d' "${binarynet1}" >> ipcounter.txt
		printf '%08d' "${binarynet2}" >> ipcounter.txt 
		printf '%08d' "${binarynet3}" >> ipcounter.txt 
		printf '%08d\n' "${binarynet4}" >> ipcounter.txt 
 
		done

elif [[ "${prefix}" -eq "16" ]]
	then
	for (( i=0; i<=254; i++));do
		for(( j=0; j<=254; j++)); do
		net3=$(("$j"))
		binarynet3=$(echo "obase=2;$net3" | bc)
	        binarynet4=$(echo "obase=2;$net4" | bc)
		printf '%08d' "${binarynet1}" >> ipcounter.txt
		printf '%08d' "${binarynet2}" >> ipcounter.txt 
		printf '%08d' "${binarynet3}" >> ipcounter.txt 
 		printf '%08d' "${binarynet4}" >> ipcounter.txt 

		done
	done
fi
