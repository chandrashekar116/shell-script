#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
echo "ERROR:: Please run this script with root access"
exit 1
else
echo "You are root "
fi

yum install mysql -y