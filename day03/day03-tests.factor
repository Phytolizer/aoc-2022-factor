! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: tools.test aoc2022.day03 io.files io.encodings.utf8 ;
IN: aoc2022.day03.tests

MEMO: example ( -- str )
    "resource:work/aoc2022/day03/example.txt" utf8 file-contents
    ;

{ "157" } [ example 1 day03 ] unit-test
{ "70" } [ example 2 day03 ] unit-test
