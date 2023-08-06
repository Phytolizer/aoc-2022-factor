! Copyright (C) 2023 Kyle Coffey.
! See https://factorcode.org/license.txt for BSD license.
USING: aoc2022.util accessors kernel math math.parser sequences
splitting ;
IN: aoc2022.day04

<PRIVATE

TUPLE: range from to ;
C: <range> range

:: range-contains? ( a b -- ? )
    a from>> b from>> <=
    a to>> b to>> >=
    and
    ;

:: range-overlaps? ( a b -- ? )
    a to>> b from>> >=
    a from>> b to>> <=
    and
    ;

: parse-ranges ( str -- ranges )
    "," split
    [
        "-" split [ string>number ] map
        first2 <range>
    ] map
    ;

:: either-swapped? ( a b quot: ( a b -- ? ) -- ? )
    a b quot execute
    b a quot execute
    or
    ; inline

:: duplicated-work-count ( str range-check?: ( a b -- ? ) -- n )
    str lines
    [ parse-ranges ] map
    [ first2 \ range-check? either-swapped? ] count
    ; inline

: part1 ( str -- n ) \ range-contains? duplicated-work-count ;
: part2 ( str -- n ) \ range-overlaps? duplicated-work-count ;

: solver ( -- solver )
    [ part1 number>string ]
    [ part2 number>string ]
    <solver>
    ;

PRIVATE>

: day04 ( str part -- str ) solver solve ;
