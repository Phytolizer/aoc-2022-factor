USING: aoc2022.util kernel math.parser sequences sorting ;
IN: aoc2022.day01

<PRIVATE
: handle-chunk ( str -- n )
    lines [ string>number ] map sum
    ;

: calories-per-elf ( str -- str )
    "\n\n" split-chunks
    [ handle-chunk ] map sort
    ;

MEMO: solver ( -- solver )
    [ calories-per-elf last number>string ]
    [ calories-per-elf 3 tail* sum number>string ]
    <solver>
    ;

PRIVATE>

: day01 ( str part -- str ) solver swap solve ;
