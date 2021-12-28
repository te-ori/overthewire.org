#!/bin/bash
. ../natas.sh
natas_url="http://natas25:GHF6X7YwACaYYssHVY05cFq83hRktl4c@natas25.natas.labs.overthewire.org"
function hack() {
	password=$(request 2>&1 | grep -Po "(?<=Password:\s)[\d\w]+")
	echo $(get-natas-url "26" "$password")
}

function request {
	curl \
		-vs \
		-d "$1" \
		--cookie "PHPSESSID=g6qelkr956e136o85udmse1417" \
		$natas_url
}

function request-to-path() {
		url=$(printf "$natas_url/$1")
		echo $url
		curl \
		-vs \
		-d "$2" \
		--cookie "PHPSESSID=g6qelkr956e136o85udmse1417" \
		$url
}

function spider-to-path() {
		url=$(printf "$natas_url/$1")
		echo $url
		wget \
		--spider \
		--no-parent \
		-r \
		$url
}