! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: tools.test aoc2022.day01 io.files io.encodings.utf8 ;
IN: aoc2022.day01.tests

MEMO: example ( -- str )
    "resource:work/aoc2022/day01/example.txt" utf8 file-contents
    ;

{ "24000" } [ example 1 day01 ] unit-test
{ "45000" } [ example 2 day01 ] unit-test
