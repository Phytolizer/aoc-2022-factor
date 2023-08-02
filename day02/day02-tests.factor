! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: tools.test aoc2022.day02 io.files io.encodings.utf8 ;
IN: aoc2022.day02.tests

MEMO: example ( -- str )
    "resource:work/aoc2022/day02/example.txt" utf8 file-contents
    ;

{ "15" } [ example 1 day02 ] unit-test
{ "12" } [ example 2 day02 ] unit-test
