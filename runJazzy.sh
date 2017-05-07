#!/bin/bash
if which jazzy >/dev/null; then
    jazzy -c -a "Alex Bartis" -u "https://github.com/trusk89" -g "https://github.com/trusk89/BartisUtilities"
else
    echo "jazzy not installed, run gem install jazzy"
fi
