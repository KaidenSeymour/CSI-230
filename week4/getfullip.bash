ip addr | grep "/24"| awk '{print $2}'| cut -b -18
