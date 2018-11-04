#!/bin/bash

echo "ip,netname,org-name,remarks,descr,country,person,address,phone,origin" > whois.csv
count=0
while IFS=, read -r a ip c
do
    #echo $ip
    whois $ip > whoisip
    netname=`cat whoisip | grep -i "netname"`
    orgname=`cat whoisip | grep -i "org-name"`
    remarks=`cat whoisip | grep -i "remarks"`
    descr=`cat whoisip | grep -i "descr"`
    country=`cat whoisip | grep -i "Country"`
    person=`cat whoisip | grep -i "person"`
    address=`cat whoisip | grep -i "address"`
    phone=`cat whoisip | grep -i "phone"`
    origin=`cat whoisip | grep -i "origin"`
    echo $ip,$netname,$orgname,$remarks,$descr,$country,$person,$address,$phone,$origin >> whois.csv
	 count=$[$count +1]
	 echo $count
	 if (( $count == 100 )); then
      sleep 2
      count=0
  	 fi
done < data.csv
