myip=$(bash myip.bash)
binaryip=$(bash binaryip.bash)
mask=$(bash binarymask.bash)
network=$(bash binarynetwork.bash)
convert=$(bash convbin2ip.bash)
echo "Hello User. Please Select an option"
echo "1.Get my IP address"
echo "2.Get my IP address in binary"
echo "3.Get my network mask in binary"
echo "4.Get my network address in binary"
echo "5.Convert Binary to IP"
echo "6.Exit"

read user
while [ "${user}" -ne "6" ]
do
  if [[ "${user}" -eq "1" ]] 
	then echo "${myip}"
  elif [[ "${user}" -eq "2" ]]
	then echo "${binaryip}"
  elif [[ "${user}" -eq "3" ]]
        then echo "${mask}"
  elif [[ "${user}" -eq "4" ]]
        then echo "${network}"
  elif [[ "${user}" -eq "5" ]]
        then echo "${convert}"
  elif [[ "${user}" -lt "1" ]]
        then echo "Please enter a valid input (1-6)"
  elif [[ "${user}" -gt "6" ]]
        then echo "Please enter a valid input (1-6)" 
	fi
echo "Enter new input"
read user
done
