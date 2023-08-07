! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: tools.test aoc2022.day06 io.files io.encodings.utf8 ;
IN: aoc2022.day06.tests

MEMO: example ( -- str )
    "resource:work/aoc2022/day06/example.txt" utf8 file-contents
    ;

{ "7" } [ example 1 day06 ] unit-test
{ "19" } [ example 2 day06 ] unit-test
