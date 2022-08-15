#!/bin/bash

#PACKAGE="wget httpd unzip"
#SVC="httpd"
URL="https://templatemo.com/tm-zip-files-2020/templatemo_518_sentra.zip"
ART_NAME="templatemo_518_sentra"
TEMPDIR="/tmp/webfiles"
yum --help &> /dev/null

if [ $? -eq 0 ]
then
    PACKAGE="wget httpd unzip"
    SVC="httpd"
    echo "Running setup on CentOS"
    echo "-------------------------------------------------------"
    echo "Installing Dependencies"
    echo "-------------------------------------------------------"
    sudo yum install $PACKAGE -y > /dev/null
    echo

    echo "-------------------------------------------------------"
    echo "Start and Enable httpd service"
    echo "-------------------------------------------------------"
    systemctl start httpd
    systemctl enable httpd
    echo

    echo "-------------------------------------------------------"
    echo "Downloading template into directory"
    cd $TEMPDIR
    wget $URL > /dev/null
    unzip $ART_NAME.zip > /dev/null
    sudo cp -r $ART_NAME/* /var/www/html/
    echo

    echo "-------------------------------------------------------"
    echo "RESTARTING HTTPD SERVER"
    systemctl restart httpd
    echo "-------------------------------------------------------"
    echo

    echo "--------------------------------------------------------"
    echo "CLEANUP PROCESS...."
    echo "--------------------------------------------------------"
    rm -rf $TEMPDIR
    echo

    sudo systemctl status $SVC
    ls /var/www/html

else
     PACKAGE="wget apache2 unzip"
    SVC="apache2"
    echo "Running setup on Ubuntu"
    echo "-------------------------------------------------------"
    echo "Installing Dependencies"
    echo "-------------------------------------------------------"
    sudo apt install $PACKAGE -y > /dev/null
    echo

    echo "-------------------------------------------------------"
    echo "Start and Enable httpd service"
    echo "-------------------------------------------------------"
    systemctl start httpd
    systemctl enable httpd
    echo

    echo "-------------------------------------------------------"
    echo "Downloading template into directory"
    cd $TEMPDIR
    wget $URL > /dev/null
    unzip $ART_NAME.zip > /dev/null
    sudo cp -r $ART_NAME/* /var/www/html/
    echo

    echo "-------------------------------------------------------"
    echo "RESTARTING HTTPD SERVER"
    systemctl restart httpd
    echo "-------------------------------------------------------"
    echo

    echo "--------------------------------------------------------"
    echo "CLEANUP PROCESS...."
    echo "--------------------------------------------------------"
    rm -rf $TEMPDIR
    echo

    sudo systemctl status $SVC
    ls /var/www/html
fi
