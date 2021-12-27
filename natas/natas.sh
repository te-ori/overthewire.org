#!/bin/bash
function get-natas-url() {
    printf "http://natas$1:$2@natas$1.natas.labs.overthewire.org"
}