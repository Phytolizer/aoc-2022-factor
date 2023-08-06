! Copyright (C) 2023 Your name.
! See https://factorcode.org/license.txt for BSD license.
USING: tools.test aoc2022.day04 io.files io.encodings.utf8 ;
IN: aoc2022.day04.tests

MEMO: example ( -- str )
    "resource:work/aoc2022/day04/example.txt" utf8 file-contents
    ;

{ "2" } [ example 1 day04 ] unit-test
{ "4" } [ example 2 day04 ] unit-test
