#!/bin/bash

echo "URL:"
read url

echo "User:"
read user

echo "Password:"
read password

echo "url=${url}" > log
echo "user=${user}" >> log
echo "password=${password}" >> log
mv log log.txt
