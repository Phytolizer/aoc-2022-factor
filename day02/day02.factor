USING: aoc2022.util combinators kernel math math.parser sequences splitting ;
IN: aoc2022.day02

<PRIVATE

CONSTANT: rock     1
CONSTANT: paper    2
CONSTANT: scissors 3

: elf ( str -- sign )
    {
        { "A" [ rock ] }
        { "B" [ paper ] }
        { "C" [ scissors ] }
    } case
    ;

: human1 ( elf str -- sign )
    swap drop
    {
        { "X" [ rock ] }
        { "Y" [ paper ] }
        { "Z" [ scissors ] }
    } case
    ;

: next ( sign -- sign )
    {
        { rock [ paper ] }
        { paper [ scissors ] }
        { scissors [ rock ] }
    } case
    ;

: human2 ( elf str -- sign )
    {
        { "X" [ 2 ] }
        { "Y" [ 0 ] }
        { "Z" [ 1 ] }
    } case
    [ next ] times
    ;

:: score ( elf human -- n )
    {
        { [ human elf next = ] [ human 6 + ] } ! human
        { [ human elf = ] [ human 3 + ] } ! draw
        { [ human elf next next = ] [ human ] } ! elf
    } cond
    ;

:: total ( str elf: ( str -- sign ) human: ( elf str -- sign ) -- n )
    str lines
    [
        " " split first2 swap
        elf execute( str -- sign )
        swap over swap human execute( elf str -- sign )
        score
    ] map
    sum
    ;

MEMO: solver ( -- solver )
    [ \ elf \ human1 total number>string ]
    [ \ elf \ human2 total number>string ]
    <solver>
    ;

PRIVATE>

: day02 ( str part -- str ) solver solve ;
