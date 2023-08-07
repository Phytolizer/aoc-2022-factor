! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USE: aoc2022.util
USING: math math.parser sequences sets ;
IN: aoc2022.day06

<PRIVATE

:: slice-backwards-from ( end n seq -- slice )
    end n -
    end
    seq <slice>
    ;

:: start-of-block ( str n -- str )
    str length n - <iota> [ n + ] map
    [| i | i n str slice-backwards-from all-unique? ] find :> ( i elt )
    elt number>string
    ;

: part1 ( str -- n ) 4 start-of-block ;
: part2 ( str -- n ) 14 start-of-block ;

: solver ( -- solver ) [ part1 ] [ part2 ] <solver> ;

PRIVATE>

: day06 ( str part -- str ) solver solve ;
