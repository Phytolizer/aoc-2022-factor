! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: aoc2022.util combinators grouping kernel math math.parser sequences ;
IN: aoc2022.day03

<PRIVATE

:: halves ( str -- array )
    str length :> len
    str len 2 /i group
    ;

CONSTANT: a CHAR: a
CONSTANT: A CHAR: A

:: common-item-priority ( seq -- n )
    seq first
    [| ch |
     seq [| str | ch str member? ] all?
    ] find swap drop
    {
        { [ dup a < ] [ A - 27 + ] }
        [ a - 1 + ]
    } cond
    ;

: part1 ( str -- n )
    lines [ halves ] map
    [ common-item-priority ] map
    sum
    ;

: part2 ( str -- n )
    lines 3 group
    [ common-item-priority ] map
    sum
    ;

: solver ( -- solver ) [ part1 number>string ] [ part2 number>string ] <solver> ;

PRIVATE>

: day03 ( str part -- n ) solver solve ;
