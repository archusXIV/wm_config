#!/bin/sh

if ! updates=$(trizen -Su --aur --quiet | wc -l); then
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo "/ $updates"
else
    echo "/ 0"
fi
