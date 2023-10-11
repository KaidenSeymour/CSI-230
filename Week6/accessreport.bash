:> access.txt
:> mypage.html

logDir="/var/log/apache2/"

allLogs=$(ls "${logDir}" | grep "access.log" | grep -v "other_vhosts" | grep -v "gz")

for i in $allLogs
  do
    cat "${logDir}""${i}" >> access.txt
  done 

cat access.txt



echo "<html>" >> mypage.html
echo "<body>" >> mypage.html
echo "<table>" >> mypage.html
echo "<tr> <th>IP</th><th>Time</th><th>RequestedPage</th><th>UserAgent</th></tr>" >> mypage.html
while read -r line; do 
 ip=$(echo "$line" | cut -d " " -f1 )
 date=$(echo "$line" | cut -d " " -f4)
 page=$(echo "$line" | cut -d " " -f7)
 agent=$(echo "$line" | cut -d " " -f12)
echo "<tr><td>${ip}</td><td>${date}</td><td>${page}</td><td>${agent}</td></tr>" >> mypage.html
done < "access.txt"
echo "</table>" >> mypage.html
echo "</body>" >> mypage.html
echo "<html>" >> mypage.html


 cp mypage.html /var/www/html/mypage.html
