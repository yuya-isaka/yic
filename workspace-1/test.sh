#!/bin/bash

assert() {
    input="$1"
    expect="$2"

    ./yic "$input" > tmp.s || exit
    gcc -static -o tmp tmp.s
    ./tmp
    output="$?"

    if [ "$expect" = "$output" ]; then
        echo "$input => $expect"
    else
        echo "$input => $expect expected, but got $output"
        exit 1
    fi
}

assert 3 3
assert 42 42

echo OK
