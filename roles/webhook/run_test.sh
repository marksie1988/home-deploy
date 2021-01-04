#!/usr/bin/env bash

set -e

usage_exit() {
        echo "Usage: $0 [-w] name" 1>&2
        exit 1
}

check="-C"
while getopts wh option
do
    case $option in
        w)
            check=""
            ;;
        h)
            usage_exit
            ;;
    esac
done

shift $((OPTIND - 1))

mkdir -p tests/cases
cases=$(ls tests/cases)
if [ ! -z $1 ];then
    cases=$1
fi
errors=0

for case in $cases
do
    ansible-playbook ./tests/test.yml -i 127.0.0.1, -t $case -e prefix_dir="cases/${case}" --ask-become-pass -vvv
    #test -d  ./tests/cases/case-1/var && sudo rm -rv ./tests/cases/case-1/var
done
