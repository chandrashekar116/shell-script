#!/bin/bash

NUM1=$1
NUM2=$2

SUM=$(($NUM1+$NUM2))

echo "TOTAL:: $SUM:"

echo "How many args passed:: $#:"

echo "All args passed:: $@:"

echo "Script name:: $0:"

