#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE 

VALIDATE(){
if [ $1 -NE 0]
    then
    echo -e "$2... $R FAILED $N"
    else
        echo -e "$2... $G SUCCESS $N"

}
if [ $ID -ne 0 ]
then
echo -e "$R ERROR:: Please run this script with root access $N"
exit 1
else
echo "You are root user"
fi 

#echo "All arguments passed: $@"
#for package in $@ #package=git


for package in $@
do
yum list installed $package &>> $LOGFILE #check installed or not 
 if [ $? -ne 0 ]  #if not installed
then 
yum install $package -y &>> $LOGFILE  #install the package
VALIDATE $? "INSTALLATION OF $package"  #validate

else
echo -e "$package is already installed.... $Y Skipping $N"
fi
done