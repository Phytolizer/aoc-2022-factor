! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: tools.test aoc2022.day05 io.files io.encodings.utf8 ;
IN: aoc2022.day05.tests

MEMO: example ( -- str )
    "resource:work/aoc2022/day05/example.txt" utf8 file-contents
    ;

{ "CMZ" } [ example 1 day05 ] unit-test
