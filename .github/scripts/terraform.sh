#!/bin/bash

echo "Let's terraform";
echo $@;
# `$*` expands the `args` supplied in an `array` individually
# or splits `args` in a string separated by whitespace.
# sh -c "echo $*"