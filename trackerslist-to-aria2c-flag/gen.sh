#!/bin/bash

wget 'https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all_ip.txt' -P /tmp
( echo -n '--bt-tracker=' && sed '/^$/d' /tmp/trackers_all_ip.txt | paste -d, -s ) > aria2c-flags.txt
rm /tmp/trackers_all_ip.txt
echo "Generation completed."
