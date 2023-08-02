! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: combinators command-line formatting io io.encodings.utf8 io.files
kernel math math.parser namespaces prettyprint sequences vectors words ;
IN: aoc2022
USING: aoc2022.day01 aoc2022.day02 ;

: dayname ( n -- str ) "day%02d" sprintf ;
: input-path ( day input -- str ) "%s/%s.txt" sprintf ;
:: run-day ( str part day -- str )
    day "aoc2022.%s" sprintf :> vocab
    day vocab lookup-word :> day
    str part day execute( str part -- str )
    ;

:: main ( -- )
    command-line get <reversed> first3
    swap string>number dayname :> day
    [ day ] dip input-path :> input
    string>number :> part

    input utf8 file-contents :> input

    input part day run-day print
    ;

MAIN: main
