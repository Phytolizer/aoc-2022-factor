! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: command-line continuations debugger formatting io io.encodings.utf8 io.files
kernel math.parser namespaces sequences system vocabs words ;
IN: aoc2022

: dayname ( n -- str ) "day%02d" sprintf ;
: input-path ( day input -- str ) "%s/%s.txt" sprintf ;
:: run-day ( str part day -- str )
    day "aoc2022.%s" sprintf :> vocab
    vocab require
    day vocab lookup-word :> day
    str part day execute( str part -- str )
    ;

:: handle-args ( args -- n )
    [
        args <reversed> first3
        swap string>number dayname :> day
        [ day ] dip input-path :> input
        string>number :> part

        input utf8 file-contents :> input

        input part day run-day print
        0
    ]
    [
        print-error
        "usage: aoc2022 <input> <day> <part>" print
        1
    ] recover
    ;

: main ( -- )
    command-line get handle-args
    flush
    exit
    ;

MAIN: main
