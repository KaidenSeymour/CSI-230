arg1=$1

Help(){
echo "===================================="
echo "syntax: ./$0 [- d/c] arg1"
echo "===================================="
}

if [ ! ${#} -eq 1 ]; then
Help
exit; 
fi

while getopts ":dc" option; do
case $option in 
  d)
    disabled=$(tail "/etc/shadow" | grep "*")
    echo "$disabled"
    ;;
  c)
    username=$(cat "usr.txt")
    logins=$(last "$username" | wc -l)
    echo "$logins"
    ;; 
esac 
done
