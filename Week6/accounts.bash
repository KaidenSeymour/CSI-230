disabled=$(tail -n 3 "/etc/shadow" | grep ":*:")
echo "$disabled"
echo hi

