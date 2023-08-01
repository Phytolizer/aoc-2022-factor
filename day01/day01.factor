USING:
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

: split-chunks ( seq subseq -- seq )
    ! seq subseq
    swap over
    ! subseq seq subseq
    { }
    [ pick f = ] [
        ! seq subseq res
        [
            ! seq subseq
            split1 swap
            ! after before
        ] dip
        ! seq after before res
        swap suffix
        ! subseq after res
        [ over ] dip
        ! after subseq res
    ] until
    [ 3drop ] dip
    ;

: calories-per-elf ( str -- str )
    "\n\n" split-chunks
    [ "\n" split
      [ string>number ] map sum
    ] map

    sort
    ;

: solve ( str part -- str )
    {
        { 1 [ calories-per-elf last ] }
        { 2 [ calories-per-elf 3 tail* sum ] }
    } case
    number>string
    ;
