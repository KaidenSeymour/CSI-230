ip=$(bash binaryip.bash)
pl=$(bash getprefix.bash)
mask=$(bash binarymask.bash)

network=""

for i in {1..32}
do

    if [[ "${ip:i:1}" -eq "1" && "${mask:i:1}" -eq "1" ]];
	then 
	  network+="1"
	else
	  network+="0" 
	fi
done 
echo "$network"
