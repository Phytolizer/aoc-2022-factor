USING:
aoc2022.util
annotations
combinators
kernel
math
math.parser
sequences
sorting
splitting
    ;
IN: aoc2022.day01

<PRIVATE
: handle-chunk ( str -- n )
    lines [ string>number ] map sum
    ;

: calories-per-elf ( str -- str )
    "\n\n" split-chunks
    [ handle-chunk ] map sort
    ;
PRIVATE>

:: solve ( str part -- str )
    part {
        { 1 [ str calories-per-elf last ] }
        { 2 [ str calories-per-elf 3 tail* sum ] }
    } case
    number>string
    ;
