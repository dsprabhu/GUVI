#!/bin/bash
URL=guvi.in
status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)
echo "The site $URL error code is $status_code"
if [ $status_code -gt 99 -a $status_code -lt 400 ] ; then
        echo "The site $URL is sucessfully connected"
elif [ $status_code -gt 399 -a $status_code -lt 501 ] ; then
        echo "The site $URL is failed to connect"
elif [ $status_code -eq 0 ] ; then
        echo "Recheck the site $URL"
else
        echo "The site is failed"
fi
