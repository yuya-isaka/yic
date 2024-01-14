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

assert 2 2
assert 50 50
assert '3+10-2' 11
assert '100-33+2-1' 68

echo OK
