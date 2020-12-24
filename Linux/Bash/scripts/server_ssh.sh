#!/bin/bash

echo 'user:' && read user
echo 'IP or address:' && read ip
echo 'port:' && read port

ssh -X $user@$ip -p $port


