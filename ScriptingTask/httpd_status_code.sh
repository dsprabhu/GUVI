#!/bin/bash
URL=guvi.in
status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)
echo "The site $URL error code is $status_code"
if [ $status_code -gt 199 -a $status_code -lt 300 ] ; then
        echo "The site $URL is sucessfully connected"
else
        echo "The site is failed"
fi
