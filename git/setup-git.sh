#!/bin/sh

echo "Setting up ssh key..."

tempdir="$(pwd)/tmp"
email="ravindu.dilshan.rd@gmail.com"

if [ ! -d $tempdir ]; then
    mkdir $tempdir
    echo "Directory ${tempdir} created."
else
    echo "Directory ${tempdir} already exists."
fi

ssh-keygen -f "${tempdir}/id_rsa2" -t rsa -b 4096 -C $email

# expect "Enter passphrase (empty for no passphrase):\r"
# send -- "ravindu\n"
