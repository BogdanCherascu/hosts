#!/bin/bash

while read -r line; do
	ip=$(echo $line | awk '{print $1}')
	name=$(echo $line | awk '(print $2)')
	if [ -n "$ip"] && [ -n "$name" ]; then
		ip_bun=$(nslookup $name 8.8.8.8 | grep 'Adress: ' | tail -n 1 | awk '{print $2}')
		if [[ "$ip"  != "$ip_bun" ]]; then
			echo "Bogus IP for $name in /etc/hosts!"
		fi
	fi
done < /etc/hosts

