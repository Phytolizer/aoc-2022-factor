! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: combinators command-line io io.encodings.utf8 io.files
kernel math.parser namespaces prettyprint sequences vectors ;
IN: aoc2022
USING: aoc2022.day01 aoc2022.day02 ;

:: main ( -- )
    command-line get <reversed> first3
    :> input :> day :> part

    input utf8 file-contents :> input
    part string>number :> part
    day string>number {
        { 1 [ input part day01 print ] }
        { 2 [ input part day02 print ] }
    } case
    ;

MAIN: main
