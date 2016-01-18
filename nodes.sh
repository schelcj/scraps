#!/bin/sh

NODES=($(cat nodes.txt))

nodelist=$(printf ",%s" "${NODES[@]}")
nodelist=${nodelist:1}

pdsh -w $nodelist

#for node in "${NODES[@]}"; do
#  ip=$(host $node|awk {'print $4'})
#
#  ssh-keyscan $node >> ~/.ssh/known_hosts
#  ssh-keyscan $ip >> ~/.ssh/known_hosts
#done
