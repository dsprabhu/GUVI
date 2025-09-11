#!/bin/bash
file="$1"
sed '5,${ /welcome/ s/give/learning/g }' "$file"
