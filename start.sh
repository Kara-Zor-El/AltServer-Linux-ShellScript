#!/bin/bash

set -e

for job in `jobs -p`
do
  wait $job
done

echo "Please connect to your device and press Enter to continue"
read key

UDID=$(lsusb -s :`lsusb | cut -d ' ' -f 4 | sed 's/://'` -v | grep iSerial)
echo "This is the UDID of your device"
echo "${UDID}"

echo "Please provide your AppleID"
read AppleID

echo "Please provide the password of AppleID"
read password

echo "Please provide the name of ipa (example: powen.ipa)"
ls ./ipa
read name

PATH=./ipa/$name

./AltServer -u ${UDID} -a $AppleID -p $password $PATH
echo "Finished"
exit
