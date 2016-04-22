#!/bin/bash

#rm -f tst
#mkfifo tst

`./sylogin`  &

for t in tst
do
        case "$variable" in
                "URL:") echo "http://www.google.fr" ;;
                "User:") echo "admin"   ;;
                "Password:") echo "root" ;;
        esac
done

