#!/bin/sh


case "$1" in

        cpu)

                echo "Current Date and Time: $(date)"
                echo "CPU Usage Details"
                echo $(sar 1 1 | grep "Average" | awk '{ print "User : "$3 " %"; }')
                echo $(sar 1 1 | grep "Average" | awk '{ print "System : "$5 " %"; }')
                echo $(sar 1 1 | grep "Average" | awk '{ print "iowait : "$6 " %"; }')
                echo $(sar 1 1 | grep "Average" | awk '{ print "idle : "$8 " %"; }')
                ;;

        disk)

                echo "Current Date and Time: $(date)"
                echo "Disk Usage Details"

                df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
                do
                echo $output
                usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
                partition=$(echo $output | awk '{ print $2 }' )
                if [ $usep -ge 90 ]; then
                echo "Running out of space \"$partition ($usep%)\""

                fi
                done
                ;;

        network)

                echo "Current Date and Time: $(date)"
                echo "Network Usage Details"

                echo $(sar -n DEV 1 1 | grep eth0 | grep Average | awk '{ print "ReceivedPacketsPerSecond: "$3 " Packets"; }')
                echo $(sar -n DEV 1 1 | grep eth0 | grep Average | awk '{ print "TransferPacketsPerSecond: "$4 " Packets"; }')
                echo $(sar -n DEV 1 1 | grep eth0 | grep Average | awk '{ print "ReceivedKBPerSecond: "$5 " KB"; }')
                echo $(sar -n DEV 1 1 | grep eth0 | grep Average | awk '{ print "TransferKBPerSecond: "$6 " KB"; }')
                ;;
        esac
